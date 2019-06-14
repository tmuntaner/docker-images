FROM opensuse/leap:15.1
ENV TERRAFORM_VERSION=0.12.1
ENV TERRAFORM_SHA256SUM=94504f4a67bad612b5c8e3a4b7ce6ca2772b3c1559630dfd71e9c519e3d6149c
RUN zypper --non-interactive in wget unzip
ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip ./
ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS ./
RUN sed -i '/.*linux_amd64.zip/!d' terraform_${TERRAFORM_VERSION}_SHA256SUMS
RUN sha256sum -c --status terraform_${TERRAFORM_VERSION}_SHA256SUMS
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin
RUN rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

FROM opensuse/leap:15.1
RUN zypper --non-interactive up
COPY --from=0 /usr/local/bin/terraform /usr/local/bin/
CMD ["/usr/local/bin/terraform"]
