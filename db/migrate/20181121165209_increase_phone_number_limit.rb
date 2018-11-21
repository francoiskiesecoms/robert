class IncreasePhoneNumberLimit < ActiveRecord::Migration[5.2]
  def change
    change_column :student, :phone_number, :integer, limit: 8
  end
end
