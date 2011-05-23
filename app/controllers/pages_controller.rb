class PagesController < ApplicationController
  def home
    @title = "Home"
    @users = User.all
    @task = Task.new
  end

  def about 
    @title = "About"
  end
end
