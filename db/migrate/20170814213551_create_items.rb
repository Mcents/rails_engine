class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.citext :name
      t.text :description
      t.integer :unit_price
      t.reference :merchant_id, foreign_key: true

      t.timestamps
    end
  end
end
