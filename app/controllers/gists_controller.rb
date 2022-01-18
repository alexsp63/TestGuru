class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    gist_question = @test_passage.current_question
    result = GistQuestionService.new(gist_question).call

    flash_options = if result.success?
                      @gist = gist_question.gists.create!(
                        url: response.html_url,
                        user: current_user
                      )
                      { notice: t('.success', link: "<a href='#{response.html_url}' target='_blank'>Gist</a>") }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end
end
