FROM opensuse/tumbleweed:latest

RUN zypper --non-interactive dup && \
    zypper --non-interactive install nginx

RUN mkdir /etc/nginx/nginxconfig.io

COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/dhparam.pem /etc/nginx/dhparam.pem
COPY files/config/* /etc/nginx/nginxconfig.io/
COPY files/vhosts/* /etc/nginx/vhosts.d/

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

RUN mkdir -p /app/web
RUN chown -R nginx:nginx /app

WORKDIR /app

EXPOSE 8080

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
