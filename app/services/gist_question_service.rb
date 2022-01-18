class GistQuestionService
  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  Response = Struct.new(:html_url) do
    def success?
      html_url.present?
    end
  end

  def call
    Response.new(@client.create_gist(gist_params).html_url)
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_GIST_TOKEN'))
  end

  def gist_params
    {
      "description": I18n.t('gists.description', title: @test.title),
      "files": {
        "test-guru-question.txt": {
          "content": gist_content
        }
      }
    }
  end

  def gist_content
    [@question.title, *@question.answers.pluck(:title)].join("\n")
  end
end
