require_relative '../lib/bot'
require 'telegram/bot'
token = '1743614866:AAGNJVfi5kFUY2938-OW3PloO-c4iyKZd1A'
Telegram::Bot::Client.run(token) do |bot|
  puts 'bot started'
  bot.listen do |message|
    delivery = Delivery.new(message, bot)
    delivery.respond
  end
end
