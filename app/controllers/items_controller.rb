class ItemsController < CrudController
  autocomplete :tag, :name, :class_name => 'ActsAsTaggableOn::Tag'
  
  def show
    @item = Item.find(params[:id])
  end

  def create
    collection = Collection.find(params[:collection_id])
    if (collection.user == current_user)
      @item = collection.items.create(item_params)
    end
    redirect_to collection_path(collection)
  end

  def update
    item = Item.find(params[:id])
    collection = Collection.find(params[:collection_id])
    if (item.collection.user == current_user)
      @item = item.update(item_params)
    end
    redirect_to collection_path(collection)
  end

  def destroy
    @item = Item.find(params[:id])
    collection = Collection.find(params[:collection_id])
    if (@item.collection.user == current_user)
      @item.destroy!
    end
    redirect_to collection_path(collection)
  end

  private
  def item_params
    params.require(:item).permit(:name, :tag_list)
  end
end
