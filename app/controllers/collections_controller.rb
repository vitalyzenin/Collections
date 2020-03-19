class CollectionsController < ApplicationController
  
  def show
    @collection = current_user.collections.find(params[:id])
  end

  def create
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
