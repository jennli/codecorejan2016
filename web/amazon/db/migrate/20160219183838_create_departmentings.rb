class CreateDepartmentings < ActiveRecord::Migration
  def change
    create_table :departmentings do |t|
      t.references :product, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
