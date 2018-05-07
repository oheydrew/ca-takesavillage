class AddColumnsToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :location_details, :string
  end
end
