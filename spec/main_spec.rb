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
  describe "#start" do
    it "when start click it sends 'Welcome to hide out cafe'" do
      delivery = Menu.new(@message, @bot)
      expect(delivery.start).to eql("Welcome to hide out cafe")
    end
  end
  describe "#available_items" do
    it "when /menu typed it displays available items" do
      delivery = Menu.new(@message, @bot)
      expect(delivery.available_items).to eql("For Hot drinks: Click '/hot_drinks'\nFor Cold drinks: Click '/cold_drinks'\n
For Food: Click '/food'")
    end
  end
end