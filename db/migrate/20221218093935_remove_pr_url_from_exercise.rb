class RemovePrUrlFromExercise < ActiveRecord::Migration[7.0]
  def change
    remove_column :exercises, :github_pr_url
    remove_column :exercises, :completed
  end
end
