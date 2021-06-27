FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /rails_app
WORKDIR /rails_app
COPY rails_app/Gemfile /rails_app/Gemfile
COPY rails_app/Gemfile.lock /rails_app/Gemfile.lock
RUN bundle install
COPY rails_app /rails_app
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]