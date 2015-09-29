class SessionsController < ApplicationController
  def new
  end

  def create

    login = params[:login]
    password = params[:password]

    user = User.where("email = ? or handle = ?", login, login).first

    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:alert] = "Something doesn't match our records. Please try again."
      render :new
    end
  end

  def delete
    session.delete :user_id
    redirect_to root_path
  end
end
