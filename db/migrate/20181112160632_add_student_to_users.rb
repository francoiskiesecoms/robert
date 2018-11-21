class AddStudentToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_student, :boolean
  end
end
