class AddTrail < ActiveRecord::Migration[7.0]
  def change
    create_table :trails do |t|
      t.text :name

      t.timestamps
    end
  end
end
