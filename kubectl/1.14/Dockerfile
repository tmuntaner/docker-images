FROM opensuse/leap:15.1

ENV KUBECTL_VERSION=1.14.3
ADD https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl ./
RUN chmod +x kubectl && mv kubectl /usr/local/bin

ENTRYPOINT ["/usr/local/bin/kubectl"]
