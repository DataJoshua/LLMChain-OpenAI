class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :text
      t.string :role
      t.references :chain

      t.timestamps
    end
  end
end
