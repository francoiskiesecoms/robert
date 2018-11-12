class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.date :date_of_birth
      t.string :address
      t.string :studies
      t.string :school
      t.integer :phone_number
      t.string :photo
      t.string :email
      t.string :motivation

      t.timestamps
    end
  end
end
