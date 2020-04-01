class BansController < AdminController

  def update
    user = User.find(params[:user_id])
    user.update(blocked: !user.blocked)
    redirect_to users_path
  end

  def destroy
    user = User.find(params[:user_id])
    user.destroy!
    redirect_to users_path
  end
end
