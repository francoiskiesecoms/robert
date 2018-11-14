class AddAcceptedToFit < ActiveRecord::Migration[5.2]
  def change
    add_column :fits, :refused, :boolean, :default => false
  end
end
