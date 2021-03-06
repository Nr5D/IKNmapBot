
# IKNmapBOT

[![Project Status: Concept – Minimal or no implementation has been done
yet, or the repository is only intended to be a limited example, demo,
or
proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![](https://img.shields.io/badge/Twitter-@IKNmap-white?style=flat&labelColor=blue&logo=Twitter&logoColor=white)](https://twitter.com/IKNmap)
[![rostrum.blog post](https://img.shields.io/badge/rostrum.blog-post-008900?style=flat&labelColor=black&logo=data:image/gif;base64,R0lGODlhEAAQAPEAAAAAABWCBAAAAAAAACH5BAlkAAIAIf8LTkVUU0NBUEUyLjADAQAAACwAAAAAEAAQAAAC55QkISIiEoQQQgghRBBCiCAIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAAh+QQJZAACACwAAAAAEAAQAAAC55QkIiESIoQQQgghhAhCBCEIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAA7)](https://www.rostrum.blog/2020/09/21/londonmapbot/)
[![IKNmapbot](https://github.com/Nr5D/IKNmapBot/actions/workflows/IKNmapbot.yml/badge.svg)](https://github.com/Nr5D/IKNmapBot/actions/workflows/IKNmapbot.yml)

Source for the Twitter bot [@IKNmap](https://www.twitter.com/IKNmap). It posts satellite images of random coordinates in Ibu Kota Negara using [{rtweet}](https://docs.ropensci.org/rtweet/), [MapBox](https://www.mapbox.com/) and [GitHub Actions](https://docs.github.com/en/actions). A very little edit from [@mattdray](https://twitter.com/mattdray).

# What

This repo contains a [GitHub Action](https://github.com/features/actions) that runs on schedule (currently every 30 minutes). It executes R code that queries [the Mapbox API](https://docs.mapbox.com/api/maps/#static-images) for a satellite image of random co-ordinates in a bounding box roughly around current IKN (Ibu Kota Negara) DKI Jakarta. The image is posted to [@IKNmap](https://www.twitter.com/IKNmap) on Twitter using [{rtweet}](https://docs.ropensci.org/rtweet/), along with a URL for that location on [OpenStreetMap](https://www.openstreetmap.org/).

See also the:

* [blog post](https://www.rostrum.blog/2020/09/21/londonmapbot/)
* [BotWiki page](https://botwiki.org/bot/londonmapbot/)
* [the rOpenSci {rtweet} use-case page](https://discuss.ropensci.org/t/a-twitter-bot-with-rtweet-mapbox-and-github-actions/2223)

<details><summary>Click for 'the mapbotverse' (other bots that have taken inspiration from londonmapbot)</summary><p>

* [@BotAtlanta](https://twitter.com/BotAtlanta) by [@jaycromwell12](https://twitter.com/jaycromwell12)
* [@BotKrakow](https://twitter.com/BotKrakow) by [@dziennikarz](https://twitter.com/warszawabot)
* [@canberramapbot](https://twitter.com/canberramapbot) by [@rexarski](https://twitter.com/rexarski)
* [@chicagomapbot](https://twitter.com/chicagomapbot) by [@geodataleo](https://twitter.com/geodataleo)
* [@coastalwalkr](https://twitter.com/coastalwalkr) by [@mattkerlogue](https://twitter.com/mattkerlogue)
* [@esmapbot](https://twitter.com/esmapbot) by [@progra_mapa](https://twitter.com/progra_mapa)
* [@immunityunity](https://github.com/codecreative/immunityunity) by [@byron_m](https://twitter.com/byron_m)
* [@italiancomuni](https://twitter.com/italiancomuni) by [@espinielli](https://twitter.com/DEJPett)
* [@narrowbotR](https://twitter.com/narrowbotR) by [@mattkerlogue](https://twitter.com/mattkerlogue)
* [@portugalmapbot](https://twitter.com/portugalmapbot) by [@joaompalmeiro](https://twitter.com/joaompalmeiro)
* [@texturesofut](https://twitter.com/texturesofut) by [@jaco_bel](https://twitter.com/jaco_bel)
* [@vambot2](https://twitter.com/vambot2) by [@DEJPett](https://twitter.com/DEJPett)
* [@warszawabot](https://twitter.com/warszawabot) by [@dziennikarz](https://twitter.com/warszawabot)
</details><p>
  
## Quick how to

See [the accompanying blog post](https://www.rostrum.blog/2020/09/21/londonmapbot/) for details, but in short:

1. Create a Twitter account for your bot
1. Sign up for developer status with [Twitter](https://developer.twitter.com/en/apply-for-access) and [MapBox](https://www.mapbox.com/)
1. Fork this repo, or click the green '[use this template](https://github.com/matt-dray/londonmapbot/generate)' button
1. Get your API keys from MapBox and Twitter and add them as [GitHub secrets](https://docs.github.com/en/actions/reference/encrypted-secrets) to your repo
1. Edit the `lat` and `lon` variables in the `londonmapbot-tweet.R` file to provide a bounding box around your location to sample coordinates from
1. Adjust the `.github/workflows/londonmapbot.yml` file to adjust [the cron schedule](https://crontab.guru/#0,30_*_*_*_*) if you want
1. GitHub Actions will recognise the .yml file and execute the code on schedule

# Image credits

Posted images are copyright of Mapbox/OpenStreetMap/Maxar. This information is embedded in every image.
