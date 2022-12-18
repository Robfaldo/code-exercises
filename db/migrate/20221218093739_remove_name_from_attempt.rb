class RemoveNameFromAttempt < ActiveRecord::Migration[7.0]
  def change
    remove_column :attempts, :name
  end
end
