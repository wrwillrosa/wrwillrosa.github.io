FROM ruby:3.3.6-alpine3.20

RUN apk add --no-cache \
        gcc=13.2.1_git20240309-r0 \
        g++=13.2.1_git20240309-r0 \
        make=4.4.1-r2

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN bundle install --no-cache

ENTRYPOINT [ "jekyll" ]
