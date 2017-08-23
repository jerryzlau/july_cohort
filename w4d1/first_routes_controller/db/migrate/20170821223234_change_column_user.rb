class ChangeColumnUser < ActiveRecord::Migration[5.1]
  def change

    remove_column :users, :email

    add_column :users, :username, :string, null: false, unique: true 
  end
end
