class CreateTaskuseranswers < ActiveRecord::Migration[6.1]
  def change
    create_table :taskuseranswers do |t|
      t.string :name
      t.integer :user_id
      t.boolean :status, null: true, default: false
      t.belongs_to :task, null: false, foreign_key: true
      t.timestamps
    end
  end
end
