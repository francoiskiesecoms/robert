class CreateSeniors < ActiveRecord::Migration[5.2]
  def change
    create_table :seniors do |t|
      t.string :name
      t.integer :age
      t.string :description
      t.references :facility, foreign_key: true

      t.timestamps
    end
  end
end
