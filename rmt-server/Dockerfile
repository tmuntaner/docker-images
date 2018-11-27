FROM opensuse/leap:15

RUN zypper --non-interactive up && \
    zypper --non-interactive install --no-recommend rmt-server

USER _rmt
WORKDIR /usr/share/rmt

EXPOSE 4224

CMD /usr/share/rmt/bin/rails s -e production -b 0.0.0.0 -p 4224
