class CreateFits < ActiveRecord::Migration[5.2]
  def change
    create_table :fits do |t|
      t.references :student, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
