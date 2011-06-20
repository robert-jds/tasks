class PagesController < ApplicationController
  def home
    @title = "Home"
    @users = User.all
    @task = Task.new

    @random_user = User.find(rand(User.count) + 1)
  end

  def about 
    @title = "About"
  end
end
