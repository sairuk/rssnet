# rssnet
rss reader - unrealircd / sopel / sopel-rss

## product versions
set product versions in `.env`

## data dirs
create `/data/ircd` and `/data/sopel` for your configs

## ircd config
under `ircd/conf`     install `unrealircd.conf`

under `ircd/conf/tls` install your certs

## sopel config
under `data/sopel` add `default.db` and `default.cfg`a

under `data/sopel/plugins` install additional plugins (rss is there as part of build)

in your default config set `host = unrealircd`

## running
* first time out: `docker-compose build`
* every other bit of magic: `docker-compose up`

## usage
1. connect to the ircd on port `6697`
2. query the bot and add rss feeds
3. join the associated channels
