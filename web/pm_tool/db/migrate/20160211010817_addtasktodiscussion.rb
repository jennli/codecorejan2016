class Addtasktodiscussion < ActiveRecord::Migration
  def change
    add_reference :discussions, :task, index: true, foreign_key: true
  end
end
