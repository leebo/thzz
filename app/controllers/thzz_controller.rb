class ThzzController < ApplicationController

  def index
    @user =User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    else
    end
  end

  private
  def user_params
    params[:user].permit(:mobile)
  end

end
