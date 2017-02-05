class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :summary, null: false
      t.string :image_url
      t.references :day, foreign_key: true

      t.timestamps
    end
  end
end
