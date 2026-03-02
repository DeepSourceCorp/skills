#!/usr/bin/env bash
#
# check_auth.sh - Check if the DeepSource CLI is installed and authenticated
#
# Usage: ./check_auth.sh
#
# Outputs JSON to stdout with keys:
#   cli_installed (bool), authenticated (bool), user (string), host (string), error (string)

set -euo pipefail

output_json() {
    local cli_installed="${1}" authenticated="${2}" user="${3}" host="${4}" error="${5}"
    printf '{"cli_installed":%s,"authenticated":%s,"user":"%s","host":"%s","error":"%s"}\n' \
        "$cli_installed" "$authenticated" "$user" "$host" "$error"
}

# Check if CLI is installed
if ! command -v deepsource &>/dev/null; then
    echo "DeepSource CLI not found in PATH" >&2
    output_json "false" "false" "" "" "deepsource CLI not found in PATH"
    exit 1
fi

# Check auth status
AUTH_OUTPUT=$(deepsource auth status 2>&1) || {
    echo "Not authenticated" >&2
    output_json "true" "false" "" "" "not authenticated"
    exit 0
}

# Parse email from output: "Logged in to DeepSource as <email>."
USER=$(echo "$AUTH_OUTPUT" | sed -n 's/.*as \(.*\)\./\1/p' | sed 's/ *(via DEEPSOURCE_TOKEN)//')

echo "Authenticated as ${USER}" >&2
output_json "true" "true" "$USER" "deepsource.com" ""
