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
      render :new
    end
  end

  def destroy
  end
end
