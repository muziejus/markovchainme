# MarkovChainMe

MarkovChainMe is a Twitter bot that builds and tweets Markov chains based twitter users you pass it. It is based on my [KarlMarxovChain](https://github.com/muziejus/karlmarxovchain) twitter bot.

It looks for a file called "configs.yml" which should look like this:

```
---
:since_id: {some Twitter id}
:consumer_key: {Gibberish from Twitter}
:consumer_secret: {Gibberish from Twitter}
:access_token: {Gibberish from Twitter}
:access_token_secret: {Gibberish from Twitter}
```

Mine is obviously in my .gitignore. 

I summon this via a cron command that looks like this:

```
*/2 * * * * cd $BOT_HOME/markovchainme ; /complex/rvm/path/to/ruby run_bot.rb  >> cron.log 2>&1 
```
