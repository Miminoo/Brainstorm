class AddAvgraitToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :avgrait, :integer, null: true, default: 0
  end
end
