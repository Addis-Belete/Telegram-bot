# rubocop: disable Metrics/AbcSize
# rubocop: disable Metrics/CyclomaticComplexity
require_relative "../lib/menu"
require_relative "../lib/list"

class Delivery
  include Select
  attr_reader :message, :bot

  def initialize
    @selected_items = []
  end

  def respond(message, bot)
    @message = message
    @bot = bot
    cmd = Menu.new(@message, @bot)
    case @message.text
    when /start/i
      text = start
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /menu/i
      text = available_items
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /hot_drinks/i
      text = cmd.hot_drinks
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /cold_drinks/i
      text = cold_drinks
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /food/i
      text = cmd.food
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /burger/i
      @selected_items << "Burger"
      text = cmd.success
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
      puts @selected_items
    when /pizza/i
      @selected_items << "Pizza"
      text = cmd.success
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
      puts @selected_items
    when /Beyeaynet/i
      text = cmd.success
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
      @selected_items << "beyeaynet"
      puts @selected_items
    when /coca/i
      @selected_items << "Cocacola"
      text = cmd.success
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /pepsi/i
      @selected_items << "Pepsi"
      text = cmd.success
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /water/i
      @selected_items << "Water"
      text = cmd.success
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /tea/i
      @selected_items << "Tea"
      text = cmd.success
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /maciato/i
      @selected_items << "Maciato"
      text = cmd.success
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /milk/i
      text = cmd.success
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
      @selected_items << "Milk"
    when /Enough/i
      text = "your selected items are: \n#{list_of_selected_items}\n Click '/Okay' to approve your order"
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /Okay/i
      text = "your Items are successufully ordered! the Delivery Man Will on Knocks your door with in 30min"
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    else
      text = "I have no idea what #{@message.text} means."
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    end
  end

  private

  def start
    "Welcome to hide out cafe Please Click: '/menu'
to get todays available foods and drinks"
  end

  def available_items
    "For Hot drinks: Click '/hot_drinks'\nFor Cold drinks: Click '/cold_drinks'\n
For Food: Click '/food'"
  end

  def cold_drinks
    "Cococala: Click '/coca'\nPepsi: Click '/pepsi'\nWater:Click '/water' "
  end
end

# rubocop: enable Metrics/CyclomaticComplexity
# rubocop: enable Metrics/AbcSize
