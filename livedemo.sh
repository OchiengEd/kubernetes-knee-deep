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

comment Run commands to validate the commands are running this momment
run_command hostname
run_command date
sleep 4

comment Lets check what resources are deployed to the default namespace
run_command kubectl get svc
run_command kubectl get deploy
run_command kubectl get rs
run_command kubectl get po
run_command kubectl get cm

comment We can the deploy our application
run_command kubectl apply -f countrycode-deployment.yaml
run_command kubectl apply -f worldtrivia-deployment.yaml 
run_command kubectl apply -f trivia-proxy.yaml 

comment Great. So how did the deployment go?
run_command kubectl get svc
run_command kubectl get deploy
run_command kubectl get rs
run_command kubectl get po
run_command kubectl get cm
