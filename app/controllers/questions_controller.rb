class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(allowed_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to  root_path, notice: 'Question successfully updated.' }
      else
        format.html { render :new }
      end
    end
  end


  def allowed_params
    params.require(:question).permit(:title, :body, :created_at, :updated_at )
  end

end
