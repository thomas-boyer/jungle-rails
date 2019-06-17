class SessionsController < ApplicationController
  def new
  end

  def update
    if @user = User.authenticate_with_credentials(params[:session][:email], params[:session][:password])
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
