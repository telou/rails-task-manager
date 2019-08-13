class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    select_task
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save
    redirect_to tasks_path
  end

  def edit
    select_task
  end

  def update
    select_task
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    select_task
    @task.destroy
    redirect_to tasks_path
  end

  private

  def select_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
