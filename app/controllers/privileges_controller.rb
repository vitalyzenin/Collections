class PrivilegesController < AdminController

  def update
    user = User.find(params[:user_id])
    user.update(admin: !user.admin)
    redirect_to users_path
  end
end
