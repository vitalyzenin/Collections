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
  end

  def destroy
  end

  private
    def collection_params
      params.require(:collection).permit(:name, :description)
    end
end
