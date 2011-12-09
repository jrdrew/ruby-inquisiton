class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.references :question

      t.timestamps
    end
    add_index :tags, :question_id
  end
end
