FROM ruby:2.7.7
ENV APP_HOME /quote_api
ARG GOOGLE_VISION_API_KEY
ARG DATABASE_URL
ARG RAILS_ENV
ENV GOOGLE_VISION_API_KEY=$GOOGLE_VISION_API_KEY
ENV DATABASE_URL=$DATABASE_URL
ENV RAILS_ENV=$RAILS_ENV
# Installation of dependencies
RUN apt-get update -qq \
  && apt-get install -y \
      # Needed for certain gems
    build-essential \
         # Needed for postgres gem
    libpq-dev \
    # The following are used to trim down the size of the image by removing unneeded data
    cron \
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
    /var/lib/apt \
    /var/lib/dpkg \
    /var/lib/cache \
    /var/lib/log
# Create a directory for our application
# and set it as the working directory
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
# Add our Gemfile and install gems
ADD Gemfile* $APP_HOME/
RUN bundle install
RUN bundle config set --local path 'vendor/cache'
# Copy over our application code
ADD . $APP_HOME

RUN whenever --update-crontab
