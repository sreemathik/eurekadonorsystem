class LoginController < ApplicationController  
  def new
	@user = User.new
  end 

  def signin
	user = User.find_by_login(params[:login])
	if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    redirect_to welcome_index_path, :notice => "Welcome back, #{user.email_address}"
	else
	    flash.now[:alert] = "Invalid login or password"
	    #render "new"
	    redirect_to :root, :notice => "Invalid login or password"
	end
  end

  def signout
	session[:user_id] = nil
	redirect_to root_url
  end
end
