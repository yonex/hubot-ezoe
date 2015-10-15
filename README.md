# hubot-ezoe

江添さんに簡単に質問出来る hubot script

See [`src/ezoe.coffee`](src/ezoe.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-ezoe --save`

Then add **hubot-ezoe** to your `external-scripts.json`:

```json
[
  "hubot-ezoe"
]
```

## Configuring

hubot-ezoe is configured by three environment variables:

* `HUBOT_EZOE_TARGET` - optional, どうしても EzoeRyou 以外に質問したいときは username を指定できる
* `HUBOT_EZOE_USERNAME` - required, あなたの ask.fm アカウントの username
* `HUBOT_EZOE_PASSWORD` - required, あなたの ask.fm アカウントの password

## Sample Interaction

```
user1>> hubot ezoe にゃーん
hubot>> EzoeRyou に「にゃーん」って質問しました
```