class SearchController < ApplicationController
  before_action :authorize

  def search
    if params[:q].nil?
      @questions = []
    else
      @questions = Question::search params[:q]
    end
  end
end
