# syntax=docker/dockerfile:1
FROM ruby:2.7.6
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /alumni-tracer-api
COPY Gemfile /alumni-tracer-api/Gemfile
COPY Gemfile.lock /alumni-tracer-api/Gemfile.lock
RUN bundle install

# Copy the rest of the application code into the container
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the Rails application
CMD ["rails", "server", "-b", "0.0.0.0"]

