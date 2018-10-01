# frozen_string_literal: true

class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if activate_acc(user)
      user.activate
      log_in user
      flash[:success] = 'Account activated!'
      redirect_to user
    else
      flash[:danger] = 'Invalid activation link'
      redirect_to root_url
    end
  end

  def activate_acc(user)
    user && !user.activated? && user.authenticated?(:activation, params[:id])
  end
end
