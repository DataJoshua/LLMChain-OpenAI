class AddDescriptionToChain < ActiveRecord::Migration[7.0]
  def change
    add_column :chains, :description, :string, null: false
  end
end
