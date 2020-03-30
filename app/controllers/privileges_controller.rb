class PrivilegesController < AdminController

  def update
    user = User.find(params[:user_id])
    if (user.admin == true)
      user.update(admin: false)
    else
      user.update(admin: true)
    end
    redirect_to users_path
  end
end
