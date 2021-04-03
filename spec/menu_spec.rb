require_relative "../lib/bot"
require_relative "../lib/menu"
require "telegram/bot"

describe Menu do
  describe "#list_of_selected_items" do
    it "returns the string with by numbering from 1" do
      delivery = Menu.new(@message, @bot)
      array = ["addis"]
      expect(delivery.list_of_selected_items(array)).to eql("1 : addis\n")
    end
  end

  describe "#hot_drinks" do
    it "it does not returns list of cold_drinks" do
      delivery = Menu.new(@message, @bot)
      expect(delivery.hot_drinks).not_to eq("tea")
    end
    describe "#selected_item" do
      it "returns pushes the new item into array" do
        delivery = Menu.new(@message, @bot)
        array = []
        expect(delivery.selected_item(array, "burger")).to eql(array << "burger")
      end
    end
  end
  describe "#hot_drinks" do
    it "returns list of hot drinks" do
      delivery = Menu.new(@message, @bot)
      expect(delivery.hot_drinks).not_to eq("tea")
    end
  end
  describe "#food" do
    it "sends list of foods when /food clicked" do
      delivery = Menu.new(@message, @bot)
      expect(delivery.food).to eql("Beyeaynet: Click '/Beyeaynet'\nBurger: Click'/burger'\nPizza: Click '/pizza'")
    end
  end

  describe "success" do
    it "it returns the string" do
      delivery = Menu.new(@message, @bot)
      expect(delivery.success).to eql("Your Item is seccussfully selected\nIf you want to add More click or type your favorite one Or Click:'/Enough' to stop")
    end
  end
end
