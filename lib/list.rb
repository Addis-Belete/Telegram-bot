module Select
  def list_of_selected_items
    string = ''
    @selected_items.each_with_index do |item, index|
      string += "#{index + 1} : #{item}\n"
    end
    string
  end
end
