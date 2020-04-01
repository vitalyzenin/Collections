class CollectionsController < CrudController
  
  def show
    @host_user = User.find(params[:user_id])
    @collection = @host_user.collections.find(params[:id])
  end

  def create
    @host_user = User.find(params[:user_id])
    @collection = current_user.collections.create(collection_params)
    redirect_to user_path(current_user)
  end

  def update
    @host_user = User.find(params[:user_id])
    @collection = current_user.collections.find(params[:id])
    @collection = @collection.update(collection_params)
    redirect_to user_path(current_user)
  end

  def destroy
    collection = current_user.collections.find(params[:id])
    collection.destroy!
    redirect_to user_path(current_user)
  end

  private
  def collection_params
    params.require(:collection).permit(:name, :description, :theme, :picture, :remove_picture, :content)
  end
end
