require_relative "../lib/bot"

class Menu
  def initialize(message, bot)
    @message = message
    @bot = bot
  end

  def hot_drinks
    "Tea: Click '/tea'\nMacaito: Click '/maciato'\nMilk: Click '/milk'"
  end

  def food
    "Beyeaynet: Click '/Beyeaynet'\nBurger: Click'/burger'\nPizza: Click '/pizza'"
  end

  def success
    "Your Item is seccussfully selected
If you want to add More click or type your favorite one Or Click:'/Enough' to stop"
  end

  def stop
    "your selected items are: \n#{list_of_selected_items}\n Click '/Okay' to approve your order"
  end

  def list_of_selected_items(array)
    string = ""
    array.each_with_index do |item, index|
      string += "#{index + 1} : #{item}\n"
    end
    string
  end

  def selected_item(array, str)
    array << str
  end
end
