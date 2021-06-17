class QuestionsController < ApplicationController
  def index
    render json: @test.questions
  end

  def show
    render json: @question
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
