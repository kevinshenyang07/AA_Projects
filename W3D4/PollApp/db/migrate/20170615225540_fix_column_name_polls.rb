class FixColumnNamePolls < ActiveRecord::Migration[5.0]
  def change
    rename_column :polls, 'user_id', 'author_id'
  end
end
