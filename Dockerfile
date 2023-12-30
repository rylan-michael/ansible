FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential sudo && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-add-repository -y ppa:neovim-ppa/unstable && \
    apt-get update && \
    apt-get install -y ansible neovim && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS rylan
ARG TAGS
RUN addgroup --gid 1000 rylan_michael
RUN adduser --gecos rylan_michael --uid 1000 --gid 1000 --disabled-password rylan_michael
RUN echo 'rylan_michael ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER rylan_michael
WORKDIR /home/rylan_michael

FROM rylan
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]

