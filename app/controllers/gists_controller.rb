class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    gist_question = @test_passage.current_question
    created_gist_link = GistQuestionService.new(gist_question).call.html_url

    @gist = gist_question.gists.build(
      url: created_gist_link,
      user: current_user
    )

    flash_options = if @gist.save
                      { notice: t('.success', link: created_gist_link) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end
end
