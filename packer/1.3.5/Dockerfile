FROM opensuse/leap:15
ENV PACKER_VERSION=1.3.5
ENV PACKER_SHA256SUM=14922d2bca532ad6ee8e936d5ad0788eba96f773bcdcde8c2dc7c95f830841ec
RUN zypper --non-interactive in wget unzip
ADD https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip ./
ADD https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_SHA256SUMS ./
RUN sed -i '/.*linux_amd64.zip/!d' packer_${PACKER_VERSION}_SHA256SUMS
RUN sha256sum -c --status packer_${PACKER_VERSION}_SHA256SUMS
RUN unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/bin
RUN rm -f packer_${PACKER_VERSION}_linux_amd64.zip

FROM opensuse/leap:15
RUN zypper --non-interactive up
COPY --from=0 /usr/local/bin/packer /usr/local/bin/
CMD ["/usr/local/bin/packer"]
