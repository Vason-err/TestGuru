class GistQuestionService
  attr_reader :question, :test, :client

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || default_client
  end

  Result = Struct.new(:url) do
    def success?
      url.present?
    end
  end

  def call
    result = Result.new
    result.url = client.create_gist(gist_options).html_url
    return result
  end

  private

  def default_client
    Octokit::Client.new(access_token: Rails.application.credentials.token_question_gist)
  end

  def gist_options
    {
      description: I18n.t('services.gist_question_service.description', title: test.title),
      public: true,
      files: {
        gist_file_name => {
          content: gist_content
        }
      }
    }
  end

  def gist_file_name
    "#{Time.current.to_i}_t#{test.id}_q#{question.id}"
  end

  def gist_content
    [question.body, *question.answers.pluck(:body)].join("\n")
  end
end
