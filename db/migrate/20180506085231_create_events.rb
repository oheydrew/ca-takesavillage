class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :owner
      t.string :title
      t.text :description
      t.text :requirements
      t.text :image_data
      t.integer :price
      t.date :start_date
      t.time :start_time
      t.integer :duration
      t.string :street
      t.string :suburb
      t.string :state
      t.string :country_code

      t.timestamps
    end

    add_foreign_key :events, :users, column: :owner_id, primary_key: :id
  end
end
