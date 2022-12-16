class AddCompletedToAttempt < ActiveRecord::Migration[7.0]
  def change
    add_column(:attempts, :completed, :boolean, default: false)
  end
end
