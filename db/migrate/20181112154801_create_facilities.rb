class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.string :address
      t.string :description
      t.references :user, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
