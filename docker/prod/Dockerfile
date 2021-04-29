FROM ruby:3.0.0
ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN gem install bundler -v 2.2.3

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

WORKDIR /pool_site_app
COPY . /pool_site_app

COPY ./docker/prod/start.sh /usr/bin/
RUN chmod +x /usr/bin/start.sh
ENTRYPOINT ["start.sh"]
EXPOSE 3000

CMD ["bin/start"]