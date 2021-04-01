require_relative '../lib/bot'
require 'telegram/bot'
token = '1609826675:AAEas_E9L_slFWKwgYOj_a4msGyCi7CGjCo'
Telegram::Bot::Client.run(token) do |bot|
  puts 'bot started'
  bot.listen do |message|
    delivery = Delivery.new(message, bot)
    delivery.respond
  end
end
