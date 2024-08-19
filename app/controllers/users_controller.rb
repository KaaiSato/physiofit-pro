class UsersController < ApplicationController
  def index
  
  end

 
  private
  
  def after_sign_in_path_for(resource)
    user_root_path
  end

end
