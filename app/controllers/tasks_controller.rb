class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  def new
    @newtask = Task.new
  end

  def create
    @newtask = Task.new(task_params)
    @newtask.save
    redirect_to task_path(@newtask)
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
