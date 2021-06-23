class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :login]

  def index
    @users=User.all
    render json: @users
  end

  def profile
    render json: @user
  end

  def create
    @user=User.create(user_params)
    # @user.valid?(render json: @user, status: :created : render json: @user, status: :not_acceptable)
  end

  def login
  @user=User.find_by(username: params[:user][:username])

    if @user&&@user.authenticate(params[:user][:password])
      @token=JWT.encode({user_id: @user.id}, ENV["SECRET_KEY_BASE"])
      render json: {user: @user, token: @token}
    else
      render json: {error: "Invalid Credentials"}, status: :unauthorized
  end
end
  private

  def user_params
    params.require(:user).permit(:username, :password,)
  end
end

