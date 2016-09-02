class ChangeColumnTasksType < ActiveRecord::Migration
  def change
    remove_column :tasks, :done
    add_column :tasks, :done, :boolean
  end
end
