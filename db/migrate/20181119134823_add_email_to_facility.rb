class AddEmailToFacility < ActiveRecord::Migration[5.2]
  def change
    add_column :facilities, :email, :string
  end
end
