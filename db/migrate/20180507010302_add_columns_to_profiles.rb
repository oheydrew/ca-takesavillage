class AddColumnsToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :suburb, :string
    add_column :profiles, :state, :string
    add_column :profiles, :country_code, :string
  end
end
