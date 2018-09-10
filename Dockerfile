FROM elixir:1.6
MAINTAINER na.tonnelier@gmail.com

ENV HOME=/usr/src/xcoin_data

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y inotify-tools build-essential postgresql-client

RUN mix local.hex --force
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez

ADD . $HOME

# install dependencies
RUN cd /usr/src/xcoin_data && mix deps.get

WORKDIR $HOME
EXPOSE 4000
