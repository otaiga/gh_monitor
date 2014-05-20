require 'octokit'

# Github client
# Not a great class name
class GithubIssue
  def issue_count
    octokit_client.list_issues(config['repo']).count
  end

  private

  def octokit_client
    @octokit_client ||= Octokit::Client.new(
      access_token: config['token']
    )
  end
end
