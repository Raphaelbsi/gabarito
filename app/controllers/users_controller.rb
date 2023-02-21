class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # Get /Users
  def index
    @users = User.all

    render json: @users
  end

  # GET /Users/1
  def show
    render json: @user
  end

  # POST Create /Users
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: }, status: :ok
    else
      render json: { error: 'User Invalid' }, status: :unprocessable_entity
    end
  end

  # POST /login
  def login
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: }, status: :ok
    else
      render json: { error: 'User Invalid' }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1

  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:username, :password, :first_name, :last_name, :email, :role)
  end
end
