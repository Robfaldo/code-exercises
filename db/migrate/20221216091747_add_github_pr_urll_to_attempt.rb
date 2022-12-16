class AddGithubPrUrllToAttempt < ActiveRecord::Migration[7.0]
  def change
    add_column :attempts, :github_pr_url, :string
  end
end
