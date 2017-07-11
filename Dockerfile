FROM ubuntu:16.04

MAINTAINER Gabriel Martins Andrade <gabrielandrade21@hotmail.com>

RUN \ 
  apt-get -qq update && \
  apt-get -qqy install ruby ruby-dev libreadline-dev libssl-dev zlib1g-dev build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev && \
  gem install bundler && \
  mkdir -p /app && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /app

VOLUME ["/root/sinatra-example/", "/app/"

COPY Gemfile /app/

RUN bundle install --quiet

COPY . /app

EXPOSE 5000

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "5000"]
