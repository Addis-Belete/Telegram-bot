require_relative "../lib/bot"
require "telegram/bot"
require "dotenv"
Dotenv.load
token = ENV["API_KEY"]
Telegram::Bot::Client.run(token) do |bot|
  puts "bot started"
  delivery = Delivery.new

  bot.listen do |message|
    delivery.respond(message, bot)
  end
end
