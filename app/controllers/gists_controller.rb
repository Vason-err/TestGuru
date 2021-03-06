class GistsController < ApplicationController
  before_action :find_test_passage, only: :create

  def create
    question = @test_passage.current_question
    result = GistQuestionService.new(question).call

    if result.success?
      gist = current_user.gists.new(question: question, url: result.url)
    end

    if gist && gist.save
      flash[:notice] = t('.success', link: view_context.link_to(gist.text_id, gist.url, target: :_blank).html_safe)
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
