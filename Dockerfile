# syntax=docker/dockerfile:experimental
FROM quay.io/lewagon/rails-base-chrome-imagemagick:dev

RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
  libidn11-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  truncate -s 0 /var/log/*log

WORKDIR /app

ENV BUNDLER_VERSION=2.1.0
ENV LANG=C.UTF-8
ENV BUNDLE_JOBS=4
ENV BUNDLE_RETRY=3

ENV GEM_HOME=/root/.bundle
ENV BUNDLE_PATH=$GEM_HOME
ENV BUNDLE_USER_HOME=$GEM_HOME
ENV BUNDLE_APP_CONFIG=$BUNDLE_PATH
ENV BOOTSNAP_CACHE_DIR=/root/.bundle/bootsnap
ENV PATH=/app/bin:$BUNDLE_BIN:$PATH

COPY Gemfile Gemfile.lock ./

RUN --mount=type=cache,target=$BUNDLE_PATH gem install bundler:$BUNDLER_VERSION && \
  bundle config set deployment 'true' && \
  bundle config set without 'development test' && \
  bundle install

COPY app/ ./app
COPY bin/ ./bin
COPY config/ ./config
COPY lib/ ./lib
COPY db/ ./db
COPY public/ ./public
COPY config.ru Rakefile postcss.config.js babel.config.js ./
RUN mkdir log

ENV RAILS_ENV=production
ENV NODE_ENV=production
ENV ASSETS_PRECOMPILE=1
ENV SECRET_KEY_BASE=1
ENV RAILS_LOG_TO_STDOUT=enabled
ENV RAILS_SERVE_STATIC_FILES=enabled

COPY package.json yarn.lock ./

RUN echo "pass1" > /app/config/master.key
RUN rails assets:precompile && rm -rf node_modules tmp/cache vendor/assets test

EXPOSE 3000