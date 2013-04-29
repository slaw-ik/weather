class CreateMnWeathers < ActiveRecord::Migration
  def change
    create_table :mn_weathers do |t|
      t.string :description
      t.string :picture_url

      t.timestamps
    end
  end
end
