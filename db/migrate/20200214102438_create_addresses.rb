class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :shippingaddress_id
      t.string :shippingaddress

      t.timestamps
    end
  end
end
