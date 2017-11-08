class SessionsController < ApplicationController
  before_action :authentificate, only: [:destroy]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    pass = Digest::SHA2.hexdigest(params[:session][:password])
    if user && user.password_hash == pass
      session[:user_id] = user.id
      redirect_to users_path
    else
      flash.now[:error] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :index
  end
end
