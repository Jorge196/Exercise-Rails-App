class UsersController < ApplicationController
   
  def show 
  
  end 

  private 

  def user_params 
    params.require(:user).permit(:user_name, :email)
  end 

end 