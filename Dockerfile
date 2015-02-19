#
# ------------------------------------------------------
#                       Dockerfile
# ------------------------------------------------------
# image:    ansible-nodejs
# tag:      latest
# name:     ansibleshipyard/ansible-nodejs
# version:  v0.1.5
# repo:     https://github.com/AnsibleShipyard/ansible-nodejs
# how-to:   docker build --force-rm -t ansibleshipyard/ansible-nodejs .
# requires: ansibleshipyard/ansible-base-ubuntu
# authors:  github:@jasongiedymin,
#           github:
# ------------------------------------------------------

FROM ansibleshipyard/ansible-base-ubuntu
MAINTAINER ansibleshipyard

# -----> Env
ENV WORKDIR /tmp/build/roles/ansible-nodejs
WORKDIR /tmp/build/roles/ansible-nodejs

# -----> Add assets
ADD ./ci $WORKDIR/ci
ADD ./meta $WORKDIR/meta
ADD ./tasks $WORKDIR/tasks
ADD ./vars $WORKDIR/vars

# -----> Install Galaxy Dependencies

# -----> Execute
RUN ansible-playbook -i $WORKDIR/ci/inventory $WORKDIR/ci/playbook.yml -c local -vvvv

# -----> Cleanup
WORKDIR /
RUN rm -R /tmp/build
