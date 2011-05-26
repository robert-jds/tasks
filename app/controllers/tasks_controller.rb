class TasksController < ApplicationController
  before_filter :authenticate

  def create
    @task = current_user.created_tasks.new(params[:task])
    if @task.save
      position = Task.where(:assigned_to_id => @task.assigned_to_id).maximum('position')
      if !position || position == ''
        @task.position = 1
      else
        @task.position = position + 1
      end
      @task.save
      flash[:success] = "Task created."
      redirect_to root_path
    else
      flash[:error] = "Problem creating that task.  Try again later?."
      render 'pages/home'
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    flash[:success] = "Task deleted."
    redirect_to root_path
  end

  def edit
    @task = Task.find(params[:id])
    @title = "Edit Task"
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      flash[:success] = "Task updated."
      redirect_to root_path
    else 
      flash[:error] = "Error Updating Task."
      redirect_to root_path
    end
  end
end
