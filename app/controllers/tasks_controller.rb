class TasksController < ApplicationController
  def home
  end

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @completed = @task.completed
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
