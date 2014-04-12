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

# Working dir
WORKDIR /tmp/build

# ADD
ADD meta $WORKDIR/meta
ADD tasks $WORKDIR/tasks
ADD tests $WORKDIR/tests
ADD vars $WORKDIR/vars

# Here we continue to use add because
# there are a limited number of RUNs
# allowed.
ADD tests/inventory /etc/ansible/hosts
ADD tests/playbook.yml $WORKDIR/playbook.yml

# Execute
RUN ansible-playbook playbook.yml -c local
