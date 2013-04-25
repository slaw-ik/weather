class CreateMnStates < ActiveRecord::Migration
  def change
    create_table :mn_states do |t|
      t.string :name
      t.integer :zip

      t.timestamps
    end
    add_index :mn_states, :zip
  end
end
