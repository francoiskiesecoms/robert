class AddUserRefToStudents < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :user, foreign_key: true
  end
end
