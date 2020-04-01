class CrudController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :block_bad_users!, except: [ :index, :show ]

  private
  
  def block_bad_users!
    if current_user.blocked
      flash[:notice] = 'You are banned!'
      redirect_to root_path
      return false
    end
  end
end
