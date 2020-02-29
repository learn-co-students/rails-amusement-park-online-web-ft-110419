class AddAdminToUsers < ActiveRecord::Migration[5.2]
    add_column :users, :admin, :boolean, default: false
end 