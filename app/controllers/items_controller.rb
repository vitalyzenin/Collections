class ItemsController < CrudController
  autocomplete :tag, :name, :class_name => 'ActsAsTaggableOn::Tag'
  
  def show
    @host_user = User.find(params[:user_id])
    @collection = @host_user.collections.find(params[:collection_id])
    @item = @collection.items.find(params[:id])
  end

  def create
    host_user = User.find(params[:user_id])
    collection = Collection.find(params[:collection_id])
    if (host_user.id == current_user.id)
      @item = collection.items.create(item_params)
    end
    redirect_to user_collection_path(host_user, collection)
  end

  def update
    host_user = User.find(params[:user_id])
    collection = Collection.find(params[:collection_id])
    @item = Item.find(params[:id])
    if (host_user.id == current_user.id)
      @item = @item.update(item_params)
    end
    redirect_to user_collection_path(host_user, collection)
  end

  def destroy
    host_user = User.find(params[:user_id])
    collection = Collection.find(params[:collection_id])
    @item = Item.find(params[:id])
    if (host_user.id == current_user.id)
      @item.destroy!
    end
    redirect_to user_collection_path(host_user, collection)
  end

  private
  def item_params
    params.require(:item).permit(:name, :tag_list)
  end
end
