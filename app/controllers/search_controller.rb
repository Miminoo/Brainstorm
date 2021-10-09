class SearchController < ApplicationController
  
  def index
    @tasks = Task.all
  end
  
  def search
    if params[:term].nil?
    @tasks = []
    else
      @tasks = Task.search params[:term]
    end
  end
end
