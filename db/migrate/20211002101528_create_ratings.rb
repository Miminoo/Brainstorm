class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.belongs_to :task, null: false, foreign_key: true
      t.integer :user_id
      t.integer :star
    end
  end
end
