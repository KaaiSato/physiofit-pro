class UsersController < ApplicationController
  def index
  
  end

  def show
    @user = User.find(params[:id])  
  end

 
  private
  
  def after_sign_in_path_for(resource)
    user_root_path
  end

end
