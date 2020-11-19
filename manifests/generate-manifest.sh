#!/usr/bin/env sh

# List the variables that are expected to be set for the .template.yml
for var in TAG APP_NAME APP_PORT IMAGE_URL; do
    value=$(printenv $var)
    if [ -z "$value" ]; then
        echo "${var} is not set. Set ${var} in the environment, or the manifest produced will be invalid."
        exit 1
    fi
    echo "${var}=${value}"
done

echo "Building manifest..."
echo
set -e
envsubst < petclinic.template.yml | tee petclinic.yml

echo
echo "Output to $(dirname $0)/petclinic.yml"
