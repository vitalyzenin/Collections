class SearchController < CrudController

  def tags
    @items = Item.tagged_with(params[:tag])
  end
end
