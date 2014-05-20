require 'octokit'

class GithubIssue

  # Can generate token in GH in repo settings.
  # https://help.github.com/articles/creating-an-access-token-for-command-line-use
  TOKEN = ENV['GH_TOKEN']
  REPO = ENV['REPO']

  def get_count
    return octokit_client.list_issues(REPO).count
  end

  private

  def octokit_client
    @octokit_client ||= Octokit::Client.new(
      access_token: TOKEN
    )
  end
end
