class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :votable, polymorphic: true, index: true
      t.timestamps
    end
    add_index :votes, [:value, :votable_id, :votable_type]
  end
end
