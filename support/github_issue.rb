require 'octokit'

class GithubIssue

  # Can generate token in GH in repo settings.
  # https://help.github.com/articles/creating-an-access-token-for-command-line-use
  def get_count
    return octokit_client.list_issues(config['repo']).count
  end

  private

  def octokit_client
    @octokit_client ||= Octokit::Client.new(
      access_token: config['token']
    )
  end
end
