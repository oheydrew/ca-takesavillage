class AddColumnToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :max_attendees, :integer, default: 10
    change_column_default :events, :duration, from: nil, to: 3600
    change_column_default :events, :price, from: nil, to: 0
    change_column_default :events, :country_code, from: nil, to: 'AU'
  end
end
