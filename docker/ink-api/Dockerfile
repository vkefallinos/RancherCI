FROM ruby:2.2

MAINTAINER Vasilis Kefallinos <vkefallinos@gmail.com>
RUN wget https://github.com/jgm/pandoc/releases/download/1.19.2.1/pandoc-1.19.2.1-1-amd64.deb
RUN dpkg -i pandoc-1.19.2.1-1-amd64.deb
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential libpq-dev git-core netcat-openbsd openjdk-7-jdk \
      openjdk-7-jre zip calibre

ENV INSTALL_PATH /ink-api

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

RUN  curl -L \
  https://gitlab.coko.foundation/INK/ink-api/repository/archive.tar.gz?ref=docker_fixes \
  | tar zx -C . --strip-components 1
RUN gem install bundler
RUN bundle install --binstubs
EXPOSE 3000:3000
CMD ["/bin/sh" , "docker/init_server.sh"]
