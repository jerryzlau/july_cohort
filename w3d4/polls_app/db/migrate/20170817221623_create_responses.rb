class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.text :answer, null: false
      t.integer :answer_choice_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :responses, :answer, unique:true
  end
end
