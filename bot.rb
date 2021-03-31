require "telegram_bot"
require_relative "./menu"

class Delivery
  include Menu

  def initialize
    @token = "1609826675:AAHCcMOoLK6BJiW14IBBaWYsD9JeyRt4YSw"
    @bot = TelegramBot.new(token: @token)
  end

  def updates
    @bot.get_updates(fail_silently: true) do |message|
      puts "@#{message.from.username}: #{message.text}"
      @command = message.get_command_for(@bot)

      message.reply do |reply|
        case @command
        when /start/i
          reply.text = "Hello Welcome to Hide out cafe telegram bot. write /menu command to get the menu of the items"
        when /menu/i
          reply.text = available_items
        when /greet/i
          greetings = ["bonjour", "hola", "hallo", "sveiki", "namaste", "salaam", "szia", "halo", "ciao"]
          reply.text = "#{greetings.sample.capitalize}, #{message.from.first_name}!"
        when /food/i
          food = ["injera", "dabo", "duket"]
          reply.text = "#{food.sample.capitalize}"
        else
          reply.text = "I have no idea what #{@command.inspect} means."
        end
        puts "sending #{reply.text.inspect} to @#{message.from.username}"
        reply.send_with(@bot)
      end
    end
  end
end

delivery = Delivery.new
delivery.updates
