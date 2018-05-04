class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.text :tagline
      t.text :bio
      t.string :first_name
      t.string :last_name
      t.text :avatar_data

      t.timestamps
    end
  end
end
