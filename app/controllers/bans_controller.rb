class BansController < AdminController

  def update
    user = User.find(params[:user_id])
    if (user.blocked == true)
      user.update(blocked: false)
    else
      user.update(blocked: true)
    end
    redirect_to users_path
  end

  def destroy
    user = User.find(params[:user_id])
    user.destroy!
    redirect_to users_path
  end
end
