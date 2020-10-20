# base image with ruby installed
FROM ruby:slim

# update tools
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        bats \
        build-essential \
        ca-certificates \
        curl \
        libffi6 \
        make \
        shellcheck \
        libffi6 \
        git-all \
    && bundle config --global silence_root_warning 1

# use Gemfile to install all dependencies
COPY Gemfile /
RUN chmod 777 Gemfile
RUN bundle install

# add entrypoint.sh which uses jekyll to generate the website
# it also creates a CNAME file if necessary
ADD entrypoint.sh /
# change mode to make it executable
RUN chmod +x /entrypoint.sh

# run the script
ENTRYPOINT ["/entrypoint.sh"]