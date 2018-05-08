class AddColumnsToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :amount, :integer
    add_column :payments, :description, :string
    rename_column :payments, :charge_id, :charge
  end
end
