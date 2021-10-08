class SearchController < ApplicationController
  def search
    if params[:term].nil?
    @tasks = []
    else
      @tasks = Task.search params[:term]
    end
  end
end
