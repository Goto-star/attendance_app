class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :company_name, :string, null: false
    add_column :users, :employ_id, :integer, null: false
  end
end
