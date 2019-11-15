FROM ruby:2.5

LABEL Name=a9s-postgres-app Version=0.0.1
EXPOSE 3000

# throw errors if Gemfile has been modified since Gemfile.lock
RUN gem install nokogiri -v '1.8.1'
RUN bundle config --global frozen 1

WORKDIR /app
COPY . /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

CMD ["ruby", "a9s-postgres-app.rb"]
