class TaskuseranswersController < ApplicationController
  
  add_flash_types :success, :danger
  
  def create
    @task = Task.find(params[:task_id])
    @current_user ||= User.find_by_id(params[:user_id]) || User.find_by_id(params[:id])
    @taskuseranswer = @task.taskuseranswers.create(taskuseranswer_params)
    if current_user.id == @taskuseranswer.user_id
        @task.answers.each do |task|
        if task.name == @taskuseranswer.name
          @current_user.update_attribute(:complete_tasks, @current_user.complete_tasks +=1)
          return redirect_to task_path(@task), success: 'The right decision'
        else
          return redirect_to task_path(@task), danger: 'Wrong decision'
        end
      end
    end
  end

  private
   def taskuseranswer_params
    params.require(:taskuseranswer).permit(:name, :status).merge(user_id: current_user.id)
   end

end