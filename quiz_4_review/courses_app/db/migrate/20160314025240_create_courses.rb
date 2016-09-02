class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :chapters, array: true, default: []

      t.timestamps null: false
    end
  end
end
