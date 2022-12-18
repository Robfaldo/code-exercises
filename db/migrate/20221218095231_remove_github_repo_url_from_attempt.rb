class RemoveGithubRepoUrlFromAttempt < ActiveRecord::Migration[7.0]
  def change
    remove_column :attempts, :github_repo_url
  end
end
