class SessionsController < ApplicationController
  include AuthHelper

  before_action :authentificate, only: [:destroy]

  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    pass = encode(params[:session][:password])
    if user && user.password_hash == pass
      sign_in user
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    cookies.clear
    redirect_to :index
  end

  def vk_callback
    unless user_token['access_token']
      render :new
    end
    user = User.find_by email: user_token['email']
    unless user
      user = User.create! name: user_params['response'][0]['first_name'], email: user_token['email'], password: password, password_confirmation: password
    end
    sign_in user
    redirect_to root_path
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  private

  def user_token
    @user_token ||= JSON.parse(Net::HTTP.get(URI("https://oauth.vk.com/access_token?client_id=#{ENV['VK_CLIENT_ID']}&client_secret=#{ENV['VK_CLIENT_SECRET']}&redirect_uri=#{ENV['VK_REDIRECT_URI']}/vk_callback&code=#{params[:code]}")))
  end

  def user_params
    @user_params ||= JSON.parse(Net::HTTP.get(URI("https://api.vk.com/method/users.get?user_ids=#{user_token['user_id']}&access_token=#{user_token['access_token']}&v=5.80")))
  end

  def password
    @password ||= generate_password
  end
end
