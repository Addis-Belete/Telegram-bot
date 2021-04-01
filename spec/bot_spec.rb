require './lib/menu'

describe Menu do
  describe '#list_of_selected_items' do
    it 'it returns string ' do
      array = ['Addis']
      expect(array.list_of_selected_items { |item, value| }).to eql('1 : Addis')
    end
  end
end
