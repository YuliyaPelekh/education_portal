class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Ласкаво просимо!"
      redirect_to '/'
    else
      flash[:error] = "Невірний email та/або пароль" 
      redirect_to '/login'
    end 
  end 

  def destroy 
    session[:user_id] = nil 
    redirect_to '/' 
  end
end
