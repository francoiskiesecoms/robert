class CreateMissions < ActiveRecord::Migration[5.2]
  def change
    create_table :missions do |t|
      t.references :senior, foreign_key: true
      t.references :student, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.string :description
      t.string :statut
      t.integer :review_ponctuality
      t.integer :review_communication
      t.integer :review_satisfaction
      t.string :review_comment

      t.timestamps
    end
  end
end
