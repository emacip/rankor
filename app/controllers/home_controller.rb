class HomeController < ApplicationController

  def index
    unless current_user.nil?
      @questions = Question.all
    end
  end
end