class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to index_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    if params["task"]["completed"].to_s == 'true'
      params["task"]["completed"] = true
    elsif params["task"]["completed"].to_s == 'false'
      params["task"]["completed"] = false
    end
    @task = Task.find(params[:id])
    @task.update({completed: params["task"]["completed"]})
    @task.update(task_params)
    @task.save!
    redirect_to show_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to index_path
  end

  private

  def task_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:task).permit(:title, :details)
  end

end
