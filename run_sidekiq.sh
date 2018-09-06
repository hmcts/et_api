#!/bin/bash

./expand_variables.sh
python ./awslogs-agent-setup.py -n -r eu-west-1 -c ./awslogs.conf
ps -eaf | grep awslogs | grep -v grep | awk -F' ' '{print $2'} | xargs kill -9
supervisord -c /etc/supervisor.conf &

bundle exec sidekiq -C config/sidekiq.yml
