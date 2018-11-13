class Addstatus < ActiveRecord::Migration[5.2]
  def change
    add_column :missions, :pending, :boolean, :default => true
  end
end
