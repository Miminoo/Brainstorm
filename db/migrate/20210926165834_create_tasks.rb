class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :topic_id
      t.string :name
      t.text :condition
      
      t.timestamps
    end
  end
end
