FROM opensuse/tumbleweed:latest

RUN zypper --non-interactive update && \
    zypper --non-interactive install npm16 python39-pip

RUN pip3 install linode-cli && \
    pip3 install boto && \
    npm install -g npm && \
    mkdir /code && \
    mkdir ~/.config

ADD linode-cli /root/.config/linode-cli
ADD compile-assets.sh /usr/local/bin/compile-assets.sh

WORKDIR /code

ENTRYPOINT ["/usr/local/bin/compile-assets.sh"]
