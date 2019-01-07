FROM opensuse/leap:15
ENV PACKER_VERSION=1.3.3
ENV PACKER_SHA256SUM=2e3ea8f366d676d6572ead7e0c773158dfea0aed9c6a740c669d447bcb48d65f
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
