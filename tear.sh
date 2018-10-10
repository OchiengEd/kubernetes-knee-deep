#!/bin/bash

HOSTNAME=`hostname`
PROMPT="\e[1m\e[32m${USER}@${HOSTNAME}\e[30m:\e[34m~\e[37m\e[0m\$ "

print_prompt() {
   echo -ne "${PROMPT}"
}

run_command() {
  print_prompt
  echo $* | pv -qL 14
  $*
}

comment() {
  print_prompt
  echo -n "# "
  echo $* | pv -qL 14
}

comment Delete the application
run_command kubectl delete -f trivia-proxy.yaml
run_command kubectl delete -f worldtrivia-deployment.yaml 
run_command kubectl delete -f countrycode-deployment.yaml

comment Verify the deployments\(s\) has been deleted from the environment
run_command kubectl get svc
run_command kubectl get deploy
run_command kubectl get rs
run_command kubectl get po
run_command kubectl get cm
