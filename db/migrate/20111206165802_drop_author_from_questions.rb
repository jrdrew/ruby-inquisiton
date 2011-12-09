class DropAuthorFromQuestions < ActiveRecord::Migration
  def up
    remove_column :questions, :author
    add_column :questions, :user_id, :integer
    
    add_index :questions, :user_id
  end

  def down
    remove_column :questions, :user_id
    add_column :questions, :author, :string
  end
end
