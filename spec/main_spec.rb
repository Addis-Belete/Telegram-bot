require_relative "../lib/bot"
require_relative "../lib/menu"
require "telegram/bot"

describe Menu do
  describe "#list_of_selected_items" do
    it "returns the string" do
      delivery = Menu.new(@message, @bot)
      array = ["addis"]
      expect(delivery.list_of_selected_items(array)).to eql("1 : addis\n")
    end
  end
end
