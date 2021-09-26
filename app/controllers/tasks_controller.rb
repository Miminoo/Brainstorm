class TasksController < ApplicationController
 
  before_action :set_task, only: [:show, :edit, :update]

  def index
    @tasks = Task.all
  end
  
  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find_by(params[:id]).destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find_by(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :topic_name,:condition, :all_answers, :all_tags, :topic_id, :avatar => [])
  end
end