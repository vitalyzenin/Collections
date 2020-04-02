class ItemsController < CrudController
  autocomplete :tag, :name, :class_name => 'ActsAsTaggableOn::Tag'
  
  def show
    @item = Item.find(params.fetch(:id))
  end

  def create
    collection = current_user.collections.find(params.fetch(:collection_id))
    if (collection.user == current_user)
      @item = collection.items.create(item_params)
    end
    redirect_to collection_path(collection)
  end

  def update
    collection = current_user.collections.find(params.fetch(:collection_id))
    item = collection.items.find(params.fetch(:id))
    if (item.collection.user == current_user)
      @item = item.update(item_params)
    end
    redirect_to collection_path(collection)
  end

  def destroy
    collection = current_user.collections.find(params.fetch(:collection_id))
    @item = collection.items.find(params.fetch(:id))
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
