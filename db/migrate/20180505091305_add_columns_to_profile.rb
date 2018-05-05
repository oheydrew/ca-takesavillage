class AddColumnsToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :website, :string
    add_column :profiles, :email_show, :boolean, default: true
  end
end
