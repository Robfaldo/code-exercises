class AddCompletedToAttempt < ActiveRecord::Migration[7.0]
  def change
    add_column(:attempts, :completed, :boolean, default: false)
  end
end

trail = Trail.create(name: "some trail")
exercise = Exercise.new(name: 'a', github_repo_url: 'b', trail: trail)
exercise.trail = Trail.last
exercise.save!
attempt = Attempt.new(github_pr_url: 'pr_url', github_repo_url: 'repo_url', exercise: exercise)
attempt.save!
