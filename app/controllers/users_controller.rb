class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Profile created!"
      redirect_to user_path(@user)
    else
      @title = "Sign up"
      render 'new'
    end
  end

  def new
    @user = User.new
    @title = "Sign up"
  end

  def show
    @user = User.find(params[:id])
    @title = "#{@user.first_name} #{@user.last_name}"
  end
end
