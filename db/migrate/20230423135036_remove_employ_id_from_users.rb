class RemoveEmployIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :employ_id, :integer
  end
end
