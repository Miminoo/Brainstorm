class CreateTaggings < ActiveRecord::Migration[6.1]
  def change
    create_table :taggings do |t|
      t.belongs_to :task, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true

      t.timestamps
    end

    add_index :taggings, [:task_id, :tag_id], unique: true
    #Ex:- add_index("admin_users", "username")
  end
end
