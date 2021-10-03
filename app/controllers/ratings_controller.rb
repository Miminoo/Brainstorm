class RatingsController < ApplicationController
  
  def create
    @task = Task.find(params[:task_id])
    @ratings = @task.ratings.find_or_initialize_by(user_id: current_user.id)
    @ratings.update(ratings_params)
    redirect_to task_path(@task)
  end

  private

  def ratings_params
    params.require(:ratings).permit(:star).merge(user_id: current_user.id)
  end

end                                         