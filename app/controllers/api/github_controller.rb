class Api::GithubController < ActionController::API
  def notify_pr_opened
    user = User.find_by(github_username: params["opened_by_github_username"])

    find_or_create_attempt(pr_number: params["pr_number"],
                           repo_url: params["repo_url"],
                           user: user,
                           repo_name: repo_name(params["repo_url"]))
  end

  def notify_pr_approved
    pr_url = pr_url(params["ref_name"].gsub("/merge", ""), repo_name(params["repo_url"]))
    raise "Approved by someone unauthorized" unless ["marleycoder", "Robfaldo"].include?(params["approver"])

    attempt = Attempt.find_by(github_pr_url: pr_url)
    attempt.completed = true
    attempt.save!
  end

  def notify_automated_tests_successful
    user = User.find_by(github_username: params["opened_by_github_username"])

    attempt = find_or_create_attempt(pr_number: params["pr_number"],
                                     repo_url: params["repo_url"],
                                     user: user,
                                     repo_name: repo_name(params["repo_url"]))

    attempt.completed = true
    attempt.save!
  end

  private

  def find_or_create_attempt(pr_number:, repo_url:, user:, repo_name:)
    github_pr_url = pr_url(pr_number, repo_name)
    attempt = Attempt.find_by(user: user, github_pr_url: github_pr_url)

    attempt || create_attempt(
      repo_url: repo_url,
      user: user,
      pr_url: github_pr_url
    )
  end

  def create_attempt(repo_url:, user:, pr_url:)
    repo_url = repo_url.gsub("git:", "https:").gsub(".git", "")

    exercise = Exercise.find_by(github_repo_url: repo_url)
    raise "Exercise not found" unless exercise

    Attempt.create!(
      github_pr_url: pr_url,
      exercise: exercise,
      user: user
    )
  end

  def pr_url(pr_number, repo_name)
    "https://github.com/codelix-org/#{repo_name}/pull/#{pr_number}"
  end

  def repo_name(repo_url)
    repo_url.gsub("git://github.com/", "").split("/").first
  end
end
