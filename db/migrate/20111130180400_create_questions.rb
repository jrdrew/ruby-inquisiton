class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.string :title
      t.text :body
      t.string :author
      t.string :client

      t.timestamps
    end
  end
end
