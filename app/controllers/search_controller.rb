class SearchController < CrudController

  def search
    if params[:query].present?
      @items = Item.search params[:query][:query],
      fields: ["name^10", "collection_name^4", "collection_descr", "name_tagged^8", "item_options", "item_value_str^7", "item_value_text^6"],
      match: :word_middle, misspellings: {below: 2, fields: [:name, :collection_name, :item_value_str, :item_value_text]}
    elsif params[:tag].present?
      @items = Item.tagged_with(params[:tag])
    end
  end
end
