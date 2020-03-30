class UsersController < CrudController

  def index
    @users = User.all.order(id: :asc)
  end

  def show
    @host_user = User.find(params[:id])
  end

  skip_before_action :block_bad_users!

  def update
    current_user.update(user_params)
    redirect_to root_path
  end

  private
  
  def user_params
    params.require(:user).permit(:locale)
  end
end
