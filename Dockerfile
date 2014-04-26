#
# ansibleshipyard/nodejs
#   docker build -t ansibleshipyard/nodejs .
#
# Requires:
# ansibleshipyard/base-ubuntu
#   https://github.com/AnsibleShipyard/base-ubuntu
#

FROM ansibleshipyard/base-ubuntu
MAINTAINER AnsibleShipyard

# Working dir
ENV WORKDIR /tmp/build/ansible-nodejs

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
RUN ansible-playbook $WORKDIR/playbook.yml -c local
