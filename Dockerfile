#
# AnsibleShipyard/base-ubuntu-nodejs
#   docker build -t AnsibleShipyard/base-ubuntu-nodejs .
#
# Requires:
# AnsibleShipyard/base-ubuntu
#   https://github.com/AnsibleShipyard/base-ubuntu
#

FROM AnsibleShipyard/base-ubuntu
MAINTAINER AnsibleShipyard
WORKDIR /tmp/build
ADD inventory /etc/ansible/hosts
ADD playbook.yml $WORKDIR/playbook.yml
ADD meta $WORKDIR/meta
ADD tasks $WORKDIR/tasks
ADD tests $WORKDIR/tests
ADD vars $WORKDIR/vars
RUN ansible-playbook playbook.yml -c local
