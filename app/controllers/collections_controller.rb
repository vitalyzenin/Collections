class CollectionsController < CrudController
  
  def show
    @collection = Collection.find(params.fetch(:id))
  end

  def create
    @collection = current_user.collections.create(collection_params)
    redirect_to user_path(current_user)
  end

  def update
    collection = current_user.collections.find(params.fetch(:id))
    if (collection.user == current_user)
      @collection = collection.update(collection_params)
    end
    redirect_to user_path(current_user)
  end

  def destroy
    @collection = current_user.collections.find(params.fetch(:id))
    if (@collection.user == current_user)
      @collection.destroy!
    end
    redirect_to user_path(current_user)
  end

  private

  def collection_params
    params.require(:collection).permit(:name, :theme, :picture, :remove_picture, :content)
  end
end
