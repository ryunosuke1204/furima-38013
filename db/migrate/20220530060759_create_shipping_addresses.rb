class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :post_code,             null: false
      t.integer :sipping_area_id,        null: false
      t.string :municipalities,         null: false
      t.string :address,          null: false
      t.string :building,    null: false
      t.string :phone_number,    null: false
      t.references :purchase_management,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
