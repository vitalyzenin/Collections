class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all.order(id: :asc)
  end

  def show
    @host_user = User.find(params[:id])
  end
end
