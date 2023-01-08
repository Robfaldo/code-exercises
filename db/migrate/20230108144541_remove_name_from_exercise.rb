class RemoveNameFromExercise < ActiveRecord::Migration[7.0]
  def change
    remove_column(:exercises, :name)
  end
end
