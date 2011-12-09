class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :user
      t.text :body
      t.references :question

      t.timestamps
    end
    add_index :replies, :user_id
    add_index :replies, :question_id
  end
end
