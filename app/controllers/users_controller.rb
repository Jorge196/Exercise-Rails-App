class UsersController < ApplicationController
   
  def show 
    @users = current_user.User.find(user_params)
  end 

  private 

  def user_params 
    params.require(:user).permit(:user_name, :email)
  end 

end 