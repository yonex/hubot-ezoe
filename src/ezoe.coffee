# Description
#   江添さんに簡単に質問出来る hubot script
#
# Dependencies:
#   "ezoe": "0.1.3"
#
# Configuration:
#   HUBOT_EZOE_TARGET
#   HUBOT_EZOE_USERNAME
#   HUBOT_EZOE_PASSWORD
#
# Commands:
#   hubot ezoe something - ask EzoeRyou something on ask.fm
#
# Author:
#   yonexyonex <yonexyonex@icloud.com>

module.exports = (robot) ->
  ezoe = require 'ezoe'

  config =
    user: process.env.HUBOT_EZOE_TARGET ? 'EzoeRyou'
    login: process.env.HUBOT_EZOE_USERNAME
    password: process.env.HUBOT_EZOE_PASSWORD

  response = (question) ->
    "#{config.user} に「#{question}」って質問しました"

  robot.respond /ezoe[\s　]*(.+)/, (msg) ->
    question = msg.match[1]
    ask = new ezoe(config.user)
    ask.checkLogin (token) ->
      if token
        ask.doLogin token, {login: config.login, password: config.password}, () ->
          ask.postQuestion question
          msg.send response(question)
      else
        ask.postQuestion(question)
        msg.send response(question)
