class Api::GithubController < ActionController::API
  def notify_pr_opened
    user = User.find_by(github_username: params["opened_by_github_username"])

    find_or_create_attempt(pr_number: params["pr_number"],
                           repo_url: params["repo_url"],
                           user: user)
  end

  def notify_pr_approved
    pr_url = pr_url(params["ref_name"].gsub("/merge", ""))
    raise "Approved by someone unauthorized" unless params["approver"] == "marleycoder"

    attempt = Attempt.find_by(github_pr_url: pr_url)
    attempt.completed = true
    attempt.save!
  end

  def notify_automated_tests_successful
    user = User.find_by(github_username: params["opened_by_github_username"])

    attempt = find_or_create_attempt(pr_number: params["pr_number"],
                                     repo_url: params["repo_url"],
                                     user: user)

    attempt.completed = true
    attempt.save!
  end

  private

  def find_or_create_attempt(pr_number:, repo_url:, user:)
    attempt = Attempt.find_by(user: user, github_pr_url: pr_url(pr_number))

    attempt || create_attempt(pr_number: pr_number, repo_url: repo_url, user: user)
  end

  def create_attempt(pr_number:, repo_url:, user:)
    debugging_data = { pr_number: pr_number, repo_url: repo_url, user: user}.to_s

    pr_url = pr_url(pr_number)
    repo_url = repo_url.gsub("git:", "https:").gsub(".git", "")

    exercise = Exercise.find_by(github_repo_url: repo_url)
    raise "Exercise not found for #{debugging_data}" unless exercise

    Attempt.create!(
      github_pr_url: pr_url,
      exercise: exercise,
      user: user
    )
  end

  def pr_url(pr_number)
    "https://github.com/marley-coder/test-exercise/pull/#{pr_number}"
  end
end
