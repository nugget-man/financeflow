class SessionsController < ApplicationController

  def new
  end

  def create
    password = params[:password]
    session[:username] = params[:username]
    if @usertemp = user.find_by_user_name(session[:username])
      usernametemp = @usertemp.username
      passwordtemp = @usertemp.password
      @usertemp = nil
      if session[:username] == usernametemp && password == passwordtemp
        authenticated = [session[:username]]
        session[:fname] = @usertemp.firstname
        session[:lname] = @usertemp.lastname
        session[:lfname] = @usertemp.lastname + ", " + @usertemp.firstname
        session[:flname] = @usertemp.firstname + " " + @usertemp.lastname
      end
    end
    if authenticated == session[:username]
      flash[:notice] = 'Successfully logged in'
      redirect_to home_path
    else
      reset_session
      redirect_to sessions_new_path
    end
  end

  def destroy
    reset_session
    flash[:notice] = 'Successfully logged out'
    redirect_to sessions_new_path
  end

  def create

  end

end
