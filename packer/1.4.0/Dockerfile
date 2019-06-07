FROM opensuse/leap:15
ENV PACKER_VERSION=1.4.0
ENV PACKER_SHA256SUM=7505e11ce05103f6c170c6d491efe3faea1fb49544db0278377160ffb72721e4
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
