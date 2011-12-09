class RemoveNameFromQuestions < ActiveRecord::Migration
  def up
    remove_column :questions, :name
  end

  def down
    add_column :questions, :name, :string
  end
end
