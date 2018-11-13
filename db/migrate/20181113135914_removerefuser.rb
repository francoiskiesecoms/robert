class Removerefuser < ActiveRecord::Migration[5.2]
  def change
    remove_column :fits, :user_id
  end
end
