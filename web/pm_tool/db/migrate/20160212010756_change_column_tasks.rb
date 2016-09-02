class ChangeColumnTasks < ActiveRecord::Migration
  def change

    rename_column :tasks, :due_date, :done

  end
end
