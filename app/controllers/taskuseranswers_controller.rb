class TaskuseranswersController < ApplicationController

  def create
    @task = Task.find(params[:task_id])
    @taskuseranswer = @task.taskuseranswers.create(taskuseranswer_params)
    redirect_to task_path(@task)
  end

  private
   def taskuseranswer_params
    params.require(:taskuseranswer).permit(:name, :user_id, :status)
   end

end