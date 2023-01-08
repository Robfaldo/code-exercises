class AddNumberToExercise < ActiveRecord::Migration[7.0]
  def change
    add_column :exercises, :number, :integer
  end
end
