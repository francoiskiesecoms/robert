class RemoveStatut < ActiveRecord::Migration[5.2]
  def change
    remove_column :missions, :statut
  end
end
