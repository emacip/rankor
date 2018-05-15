class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(allowed_params)
    @question.user_id = current_user.id
    respond_to do |format|
      if @question.save
        format.html { redirect_to  root_path, notice: 'Question successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  def allowed_params
    params.require(:question).permit(:title, :body, :user_id, :created_at, :updated_at )
  end

end
