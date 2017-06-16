class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.integer :user_id, null: false
      t.integer :question_id, null: false

      t.timestamps
    end

    # add_index :resposes, [:user_id, :question_id], unique: true
  end
end
