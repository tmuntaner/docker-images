FROM opensuse/leap:15
ENV PACKER_VERSION=1.4.1
ENV PACKER_SHA256SUM=b713ea79a6fb131e27d65ec3f2227f36932540e71820288c3c5ad770b565ecd7
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
