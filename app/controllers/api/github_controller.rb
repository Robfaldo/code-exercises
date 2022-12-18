class Api::GithubController < ActionController::API
  def notify_pr_opened
    pr_url = pr_url(params["pr_number"])
    repo_url = params["repo_url"].gsub("git:", "https:").gsub(".git", "")

    exercise = Exercise.find_by(github_repo_url: repo_url)
    raise "Exercise not found for params: #{params}" unless exercise

    user = User.find_by(github_username: params["opened_by_github_username"])
    raise "User not found for params: #{params}" unless exercise

    Attempt.create!(
      github_pr_url: pr_url,
      exercise: exercise,
      user: user
    )
  end

  def notify_pr_approved
    pr_url = pr_url(params["ref_name"].gsub("/merge", ""))
    raise "Approved by someone unauthorized" unless params["approver"] == "marleycoder"

    attempt = Attempt.find_by(github_pr_url: pr_url)
    attempt.completed = true
    attempt.save!
  end

  private

  def pr_url(pr_number)
    "https://github.com/marley-coder/test-exercise/pull/#{pr_number}"
  end
end
