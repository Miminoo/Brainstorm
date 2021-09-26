class CreateAnswerings < ActiveRecord::Migration[6.1]
  def change
    create_table :answerings do |t|
      t.belongs_to :task, null: false, foreign_key: true
      t.belongs_to :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
