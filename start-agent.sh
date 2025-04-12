#!/bin/bash
set -e

if [ ! -f .agent ]; then
  echo "Configuring Azure DevOps agent for $(hostname)..."
  ./config.sh --unattended \
    --url "https://dev.azure.com/$AZP_ORG" \
    --auth pat \
    --token "$AZP_TOKEN" \
    --pool "$AZP_POOL" \
    --agent "$(hostname)" \
    --acceptTeeEula \
    --work _work
fi

exec ./run.sh
