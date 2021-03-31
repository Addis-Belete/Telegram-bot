require "telegram_bot"

class Delivery
  token = "1609826675:AAHCcMOoLK6BJiW14IBBaWYsD9JeyRt4YSw"
  bot = TelegramBot.new(token: token)

  bot.get_updates(fail_silently: true) do |message|
    puts "@#{message.from.username}: #{message.text}"
    command = message.get_command_for(bot)

    message.reply do |reply|
      case command
      when /start/i
        reply.text = "Hello Welcome to Hideout cafe telegram bot. write /menu command to get the available food."
      when /menu/i
        reply.text = "Breakfast"
        reply.text = "Launch"
        reply.text = "Dinner"
        reply.text = "Soft Drinks"
        reply.text = "Hot-Drinks"
      when /greet/i
        greetings = ["bonjour", "hola", "hallo", "sveiki", "namaste", "salaam", "szia", "halo", "ciao"]
        reply.text = "#{greetings.sample.capitalize}, #{message.from.first_name}!"
      when /food/i
        food = ["injera", "dabo", "duket"]
        reply.text = "#{food.sample.capitalize}"
      else
        reply.text = "I have no idea what #{command.inspect} means."
      end
      puts "sending #{reply.text.inspect} to @#{message.from.username}"
      reply.send_with(bot)
    end
  end
end

delivery = Delivery.new
