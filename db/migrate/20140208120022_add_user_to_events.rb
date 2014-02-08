class AddUserToEvents < ActiveRecord::Migration
  def change
    add_column :events, :user_bool, :boolean
    add_index :events, :user_bool
  end
end
