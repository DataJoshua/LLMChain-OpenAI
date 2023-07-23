class AddClusterNameToChains < ActiveRecord::Migration[7.0]
  def change
    add_column :chains, :cluster_name, :string
  end
end
