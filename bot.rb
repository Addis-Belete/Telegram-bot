require "telegram_bot"
require_relative "./menu"

class Delivery
  include Menu

  def initialize
    @token = "1609826675:AAHCcMOoLK6BJiW14IBBaWYsD9JeyRt4YSw"
    @bot = TelegramBot.new(token: @token)
    @selected_items = []
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
        when /hot_drinks/i
          reply.text = hot_drinks
        when /cold_drinks/i
          reply.text = cold_drinks
        when /food/i
          reply.text = food
        when /burger/i
          @selected_items << "Burger"
          reply.text = success
          puts @selected_items
        when /pizza/i
          @selected_items << "Pizza"
          reply.text = success
          puts @selected_items
        when /Beyeaynet/i
          @selected_items << "Beyeaynet"
          reply.text = success
          puts @selected_items
        when /coca/i
          @selected_items << "Cocacola"
          reply.text = success
          puts @selected_items
        when /pepsi/i
          @selected_items << "Pepsi"
          reply.text = success
          puts @selected_items
        when /water/i
          @selected_items << "Water"
          reply.text = success
          puts @selected_items
        when /tea/i
          @selected_items << "Tea"
          reply.text = success
          puts @selected_items
        when /maciato/i
          @selected_items << "Maciato"
          reply.text = success
          puts @selected_items
        when /milk/i
          @selected_items << "Milk"
          reply.text = success
          puts @selected_items
        when /Enough/i
          reply.text = "your selected items are: \n#{list_of_selected_items}"
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
