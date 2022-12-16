class AddExercise < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :github_repo_url

      t.timestamps
    end
  end
end
