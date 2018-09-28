# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index show]
  before_action :authorize_user!, only: %i[edit update]
  before_action :is_admin?, only: :destroy

  def index
    @users = User.where(activated: true).paginate(page: params[:page], per_page: 10)
  end

  def show
    set_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = 'Please check your email to activate your account.'
      redirect_to login_path
    else
      render 'new'
    end
  end

  def edit
    set_user
  end

  def update
    set_user
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

  def authorize_user!
    set_user
    redirect_to(root_url) unless current_user?(@user)
  end

  def is_admin?
    redirect_to(root_url) unless current_user.admin?
  end

  def set_user
    @user = User.find(params[:id])
  end
end
