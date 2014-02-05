#!/usr/bin/env bash
# Clones all of the repos

echo "Cloning all of the repos"

all_repos="acceptance aggregator ami-build-scripts api-clients api-core api-demo api-logging api-specs api-utils authentication celery-windows cheeseshop chunker ci-tools code-review congestion congestion-module conman-tasks Customer Service customer_service dingley django encode-node heartbeat hls http-live-streaming image itv-integration-tests jenkins-tools keydelivery licensing load-test locker m2crypto monitor nginx-conf packager packager-widevine payment paymentgateway paymentkey paymenttax paymentutils pdiag performance pipeline pobSi postman primo puppet reporting reporting-reborn reporting_teleboy sd-encode-service sdp-conman-proj sdp-image sdp-nexus-authorization sdp-nexus-core sdpayment_test_harness Service Manager services service_manager silverlight-player storefront storefront-fake-token-exchange subtitle subtitle-service svod tokSi trans transformer vagrant voucher wafer thin mint widevine w_3.0_migration"

for r in $all_repos; do
    echo Cloning repo $r
    git clone ssh://git@stash.saffrondigital.com:7999/nex/$r.git
done

venvs=sdp-conman-proj storefront

for r in $venvs; do
    echo Setting up dev env for $r
    mkdir $r/venv
    virtualenv --no-site-packages $r/venv
done

# Need to manually do the activate and make install
