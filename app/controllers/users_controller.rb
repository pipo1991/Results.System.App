class UsersController < ApplicationController
  
  def new
     if current_user.account_type == "Admin" then
      @user = User.new
    end
  end
  
  def create
     if current_user.account_type == "Admin" then
      @user = User.new(params[:user])
      if @user.save
        redirect_to root_url, :notice => "Signed up!"
      else
        render "new"
      end
    end
  end

end
