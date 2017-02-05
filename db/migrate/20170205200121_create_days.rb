class CreateDays < ActiveRecord::Migration[5.0]
  def change
    create_table :days do |t|
      t.date :date

      t.timestamps
    end
    add_index :days, :date, unique: true
  end
end
