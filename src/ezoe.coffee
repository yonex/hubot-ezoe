# Description
#   江添さんに簡単に質問出来る hubot script
#
# Dependencies:
#   "ezoe": "^0.1.3"
#   "minimist": "^1.2.0"
#
# Configuration:
#   HUBOT_EZOE_USERNAME
#   HUBOT_EZOE_PASSWORD
#
# Commands:
#   hubot ezoe something - ask EzoeRyou something on ask.fm
#
# Author:
#   yonexyonex <yonexyonex@icloud.com>

module.exports = (robot) ->
  Askfm = require 'ezoe'
  parseArgs = require 'minimist'

  config =
    username: process.env.HUBOT_EZOE_USERNAME
    password: process.env.HUBOT_EZOE_PASSWORD

  response = (account, question) ->
    "#{account} に「#{question}」って質問しました"

  robot.respond /ezoe\s+(.+)/, (msg) ->
    argv = parseArgs msg.match[1].split(/\s+/), {string: 'user', alias: {u: 'user'}, default: {user: 'EzoeRyou'}}
    question = argv._.join ' '
    ask = new Askfm(argv.user)
    ask.checkLogin (token) ->
      if token
        ask.doLogin token, {login: config.username, password: config.password}, () ->
          ask.postQuestion question
          msg.send response(ask.account, question)
      else
        ask.postQuestion question
        msg.send response(ask.account, question)
