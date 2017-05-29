FROM inkmap/ink-api-base-image:latest
MAINTAINER Vasilis Kefallinos <vasilios.kefallinos@sourcefabric.org>
ENV INSTALL_PATH /ink-api
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH
RUN  curl -L \
  https://gitlab.coko.foundation/INK/ink-api/repository/archive.tar.gz?ref=0.1 \
  | tar zx -C . --strip-components 1
RUN gem install bundler
RUN bundle install --binstubs
# run bundle check to regenerate gemfile.lock file
CMD ["/bin/sh" , "docker/init_server.sh"]
