class ChangeColumnInResponses < ActiveRecord::Migration[5.0]
  def change
    rename_column :responses, "question_id", "answer_choice_id"
  end
end
