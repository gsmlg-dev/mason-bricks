#!/bin/bash

CI_BUILD_NUMBER=${1:-1} bundle exec fastlane deploy_staging_testflight
