class AddTrailsToExercises < ActiveRecord::Migration[7.0]
  def change
    add_reference :exercises, :trail, null: false, foreign_key: true
  end
end
