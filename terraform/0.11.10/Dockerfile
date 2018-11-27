FROM opensuse/leap:15
ENV TERRAFORM_VERSION=0.11.10
ENV TERRAFORM_SHA256SUM=f991039e3822f10d6e05eabf77c9f31f3831149b52ed030775b6ec5195380999
RUN zypper --non-interactive in wget unzip
ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip ./
ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS ./
RUN sed -i '/.*linux_amd64.zip/!d' terraform_${TERRAFORM_VERSION}_SHA256SUMS
RUN sha256sum -c --status terraform_${TERRAFORM_VERSION}_SHA256SUMS
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin
RUN rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

FROM opensuse/leap:15
RUN zypper --non-interactive up
COPY --from=0 /usr/local/bin/terraform /usr/local/bin/
CMD ["/usr/local/bin/terraform"]
