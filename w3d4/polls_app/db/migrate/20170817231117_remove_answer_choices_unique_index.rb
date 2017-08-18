class RemoveAnswerChoicesUniqueIndex < ActiveRecord::Migration[5.1]
  def change
    remove_index(:answer_choices, :choice)
  end
end
