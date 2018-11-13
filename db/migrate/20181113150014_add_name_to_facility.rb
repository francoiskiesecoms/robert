class AddNameToFacility < ActiveRecord::Migration[5.2]
  def change
    add_column :facilities, :name, :string
  end
end
