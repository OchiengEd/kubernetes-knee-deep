#!/bin/bash

resource_check() {
  scriptreplay --timing assets/resource.time assets/resource.screen
}

deploy_trivia_webapp() {
  scriptreplay --timing assets/deploy.time assets/deploy.screen
}

verify_deployment() {
  scriptreplay --timing assets/deploycheck.time assets/deploycheck.screen
}

echo "# Ensure there are no applications running in the default namespace" | pv -qL 14
resource_check

echo "# Deploy trivia application" | pv -qL 14
deploy_trivia_webapp

echo "# Verify all pods are up and running" | pv -qL 14
verify_deployment
