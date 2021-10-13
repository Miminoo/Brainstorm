class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index,]
  before_action :set_task, only: [:show, :edit, :update]
  before_action :fetch_tags, only: %i[new edit]
  
  def index
    @tasks = Task.order("created_at DESC")
    @q = Task.ransack(params[:q])
    if @q
      @tasks = @q.result(distinct: true)
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
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
    @task = Task.find(params[:id]).destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :topic_name,:condition, :all_answers, :topic_id, :avatar => [], :tag_ids => [])
  end

  def fetch_tags
    @tags = Tag.all
  end

end