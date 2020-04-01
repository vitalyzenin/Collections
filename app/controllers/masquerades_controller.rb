class MasqueradesController < Devise::MasqueradesController
  protected

  def after_masquerade_path_for(user)
    user_path
  end

  def after_back_masquerade_path_for(user)
    root_path
  end
end
