module Menu
  def available_items
    return "For Hot drinks: Click '/hot_drinks'\nFor Cold drinks: Click '/cold_drinks'\n
For Food: Click '/food'"
  end

  def cold_drinks
    return "Cococala: Click '/coca'\nPepsi: Click '/pepsi'\nWater:Click '/water' "
  end

  def hot_drinks
    return "Tea: Click '/tea'\nMacaito: Click '/maciato'\nMilk: Click '/milk'"
  end

  def food
    return "Beyeaynet: Click '/Beyeaynet'\nBurger: Click'/burger'\nPizza: Click '/pizza'"
  end
end
