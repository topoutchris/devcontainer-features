#!/bin/bash

# The 'test/_global' folder is a special test folder that is not tied to a single feature.
#
# This test file is executed against a running container constructed
# from the value of 'devcontainer-doppler-cli' in the tests/_global/scenarios.json file.
#
# The value of a scenarios element is any properties available in the 'devcontainer.json'.
# Scenarios are useful for testing specific options in a feature, or to test a combination of features.
# 
# This test can be run with the following command (from the root of this repo)
#    devcontainer features test --global-scenarios-only .

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
check "Check if Doppler CLI is installed" command -v doppler
check "Check Doppler CLI version" doppler --version

# Check if Doppler CLI can be used
check "Check Doppler CLI functionality" bash -c "doppler run -- echo 'Doppler CLI is working'"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults