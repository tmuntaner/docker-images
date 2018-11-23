FROM opensuse/leap:15
ENV PACKER_VERSION=1.3.2
ENV PACKER_SHA256SUM=5e51808299135fee7a2e664b09f401b5712b5ef18bd4bad5bc50f4dcd8b149a1
RUN zypper --non-interactive up && \
    zypper --non-interactive in wget unzip
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
