class QuestionsController < ApplicationController

  before_action :find_test, only: [:index, :new, :create]
  before_action :find_question, only: [:show, :destroy]

  def index
    render json: @test.questions
  end

  def show
    render json: @question
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to question_path(@question)
      render plain: 'Question created'
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.test)
    render plain: 'Question deleted'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

end
