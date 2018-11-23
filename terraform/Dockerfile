FROM golang:alpine
ENV TERRAFORM_VERSION=0.11.10
RUN apk add --update git bash openssh
ENV TF_RELEASE=true
WORKDIR $GOPATH/src/github.com/hashicorp/terraform
RUN git clone https://github.com/hashicorp/terraform.git ./ && \
    git checkout v${TERRAFORM_VERSION} && \
    /bin/bash scripts/build.sh

FROM opensuse/leap:15
RUN zypper --non-interactive up
COPY --from=0 /go/bin/terraform /usr/local/bin/
CMD ["/usr/local/bin/terraform"]
