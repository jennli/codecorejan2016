class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :body

      t.timestamps null: false
    end
  end
end
