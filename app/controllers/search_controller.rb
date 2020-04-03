class SearchController < CrudController

  def tags
    @items = Item.search "lalalala", fields: [:name, :collection_descr], match: :word_middle, misspellings: {below: 2, fields: [:name]}
    #@items = Item.all
    #@items = Item.tagged_with(params[:tag])
  end
end
