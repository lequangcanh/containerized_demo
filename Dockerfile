FROM ruby:3.0.0

ENV APP_DIR /myapp
RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR

COPY Gemfile $APP_DIR/Gemfile
COPY Gemfile.lock $APP_DIR/Gemfile.lock
RUN gem install bundler:2.2.4
RUN bundle install

COPY . $APP_DIR

RUN bundle exec rails db:migrate

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
