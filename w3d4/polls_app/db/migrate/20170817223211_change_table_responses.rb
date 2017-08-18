class ChangeTableResponses < ActiveRecord::Migration[5.1]
  def change
    remove_column :responses, :user_id

    add_column :responses, :author_id, :integer, {null: false}
  end
end
