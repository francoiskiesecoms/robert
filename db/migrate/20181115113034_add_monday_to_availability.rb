class AddMondayToAvailability < ActiveRecord::Migration[5.2]
  def change
    add_column :availabilities, :monday, :boolean, :default => true
    add_column :availabilities, :tuesday, :boolean, :default => true
    add_column :availabilities, :wednesday, :boolean, :default => true
    add_column :availabilities, :thursday, :boolean, :default => true
    add_column :availabilities, :friday, :boolean, :default => true
    add_column :availabilities, :saturday, :boolean, :default => true
    add_column :availabilities, :sunday, :boolean, :default => true
  end
end
