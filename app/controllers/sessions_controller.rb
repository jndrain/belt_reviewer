class SessionsController < ApplicationController
  def index
    render "index"
  end
  def register
  	@user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], city: params[:city], state: params[:state], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.valid?
      redirect_to "/events"
    else
    	flash[:errors] = "Invalid"
      redirect_to "/"
    end
  end
  def login
    @user = User.where(email: params[:email]).first
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect_to "/events"
    else
      flash[:errors] = "Invalid"
      redirect_to "/"
    end
  end

  def logout
    reset_session
    redirect_to "/"
  end
end
