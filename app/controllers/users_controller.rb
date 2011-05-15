class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
    @title = "#{@user.first_name} #{@user.last_name}"
  end
end
