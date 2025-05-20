FROM golang:1.23

RUN apt-get update && \
    apt-get install -y git make vim wget curl unzip jq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget -O helm-amd64.tar.gz https://get.helm.sh/helm-v3.18.0-linux-amd64.tar.gz && \
    tar -zxvf helm-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    rm -rf linux-amd64 && \
    chmod +x /usr/local/bin/helm
RUN wget -O /usr/local/bin/kubectl https://dl.k8s.io/release/v1.28.0/bin/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl
RUN curl https://releases.rancher.com/install-docker/24.0.sh | sh
RUN wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

