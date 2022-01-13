class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to redirection_page
    else
      flash.now[:alert] = 'Enter correct email and password'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

  private

  def redirection_page
    cookies.delete(:original) || tests_path
  end
end
