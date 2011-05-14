class UsersController < ApplicationController
  def new
  end

  def show
    @title = 'User Profile'
    @user = User.find(params[:id])
  end
end
