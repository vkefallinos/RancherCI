FROM nginx:1.9.9

ENV HTPASSWD='foo:$apr1$odHl5EJN$KbxMfo86Qdve2FH4owePn.' \
    FORWARD_PORT=80 \
    FORWARD_HOST=web

WORKDIR /opt
ADD ./auth.conf /etc/nginx/conf.d/default.conf
ADD ./auth.htpasswd /etc/nginx/users.htpasswd
COPY launch.sh ./
CMD ["./launch.sh"]
