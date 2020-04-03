class SearchController < CrudController

  def search
    if params[:query].present?
      @items = Item.search params[:query][:query], fields: [:name, :collection_name, :collection_descr], match: :word_middle, misspellings: {below: 2, fields: [:name, :collection_name, :collection_descr]}
    elsif params[:tag].present?
      @items = Item.tagged_with(params[:tag])
    end
  end
end
