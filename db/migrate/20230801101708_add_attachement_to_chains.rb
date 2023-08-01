class AddAttachementToChains < ActiveRecord::Migration[7.0]
  def change
    remove_column :chains, :attachement
  end
end
