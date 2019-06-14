class SessionsController < ApplicationController
  def new
  end

  def update
    @user = User.where(email: params[:session][:email])[0]

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      session[:email] = @user.email
      redirect_to :root
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to :root
  end


end
