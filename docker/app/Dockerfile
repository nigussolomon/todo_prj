FROM ruby:3.2.2

RUN echo "Africa/Addis_Ababa" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update -qq && \
    apt-get install -y build-essential tzdata postgresql-client nodejs npm yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man

RUN mkdir /app
WORKDIR /app

ENV RAILS_LOG_TO_STDOUT="1" \
    RAILS_SERVE_STATIC_FILES="true" \
    BUNDLE_WITHOUT="development test"

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
RUN bundle exec bootsnap precompile --gemfile app/ lib/
RUN rails assets:precompile

COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
EXPOSE 3000

CMD [ "bundle", "exec", "puma", "-C", "config/puma.rb" ]
