class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all.order(id: :asc)
  end

  def show
  end
end
