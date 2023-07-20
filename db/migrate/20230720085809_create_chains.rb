class CreateChains < ActiveRecord::Migration[7.0]
  def change
    create_table :chains do |t|
      t.references :user
      t.string :index_name
      t.timestamps
    end
  end
end
