class AddIsStudentToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :student, :is_student
  end
end
