#!/bin/bash

set -euo pipefail

# change to parent directory of this script so the context is correct
cd $(dirname $(dirname "$0"))

TF_CLI_ARGS=${TF_CLI_ARGS:-}
TF_LOG=${TF_LOG:-info}

terragrunt destroy ${TF_CLI_ARGS} --terragrunt-log-level ${TF_LOG}