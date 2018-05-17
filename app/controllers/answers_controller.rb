class AnswersController < ApplicationController
  before_action :authorize

  def new
    @question = Question.find params[:question_id]
    @answer = Answer.new(user_id: current_user.id, question_id: @question.id)
  end

  def create
    @answer = Answer.new(allowed_params)
    @answer.user_id = current_user.id
    @answer.question_id = params[:question_id]
    respond_to do |format|
      if @answer.save
        format.html { redirect_to  question_path( @answer.question_id), notice: 'Answer successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def allowed_params
    params.require(:answer).permit(:body, :user_id, :question_id, :created_at, :updated_at )
  end

end
