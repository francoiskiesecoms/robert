class Addmissionref < ActiveRecord::Migration[5.2]
  def change
    add_reference :fits, :mission, index: true
  end
end
