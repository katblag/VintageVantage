class SessionsController < ApplicationController
  before_filter :require_no_current_user!, :only => [:create, :new]
  
  respond_to :json, :only => [:create]
  
  def create
    @user = User.find_by_username(params[:user][:username])

    if @user && (@user.is_password?(params[:user][:password]))
      self.current_user = @user
      
      render "users/user"
    else
      render :text => "Invalid username or password", :status => 422
    end
  end
  
  def create_fbook
    render :text => "woo facebook login"
  end

  def destroy
    logout_current_user!
    redirect_to root_url
  end
end