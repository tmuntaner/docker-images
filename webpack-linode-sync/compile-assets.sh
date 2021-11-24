#!/usr/bin/env bash

./node_modules/.bin/webpack
linode-cli obj --cluster=eu-central-1 put --acl-public ./web/assets/* ${BUCKET_NAME}
