# rubocop: disable Metrics/AbcSize
# rubocop: disable Metrics/CyclomaticComplexity
require_relative '../lib/menu'

class Delivery
  include Select
  attr_reader :message, :bot

  def initialize(message, bot)
    @message = message
    @bot = bot
    @selected_items = []
  end

  def respond
    cmd = Menu.new(@message, @bot)

    case @message.text
    when /start/i
      text = cmd.start
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /menu/i
      text = cmd.available_items
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /hot_drinks/i
      text = cmd.hot_drinks
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /cold_drinks/i
      text = cmd.cold_drinks
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /food/i
      text = cmd.food
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /burger/i
      @selected_items.push('Burger')
      text = cmd.success
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
      puts @selected_items
    when /pizza/i
      @selected_items << 'Pizza'
      text = cmd.success
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /Beyeaynet/i
      text = cmd.success
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
      @selected_items << 'Beyeaynet'
    when /coca/i
      @selected_items << 'Cocacola'
      text = cmd.success
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /pepsi/i
      @selected_items << 'Pepsi'
      text = cmd.success
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /water/i
      @selected_items << 'Water'
      text = cmd.success
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /tea/i
      @selected_items << 'Tea'
      text = cmd.success
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /maciato/i
      @selected_items << 'Maciato'
      text = cmd.success
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /milk/i
      @selected_items << 'Milk'
      text = cmd.success
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /Enough/i
      text = "your selected items are: \n#{list_of_selected_items}\n Click '/Okay' to approve your order"
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    when /Okay/i
      text = 'your Items are successufully ordered! the Delivery Man Knocks your door with in 30min'
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    else
      text = "I have no idea what #{@message.text} means."
      @bot.api.send_message(chat_id: @message.chat.id, text: text)
    end
  end
end

# rubocop: enable Metrics/CyclomaticComplexity
# rubocop: enable Metrics/AbcSize
