class RemoveColumnProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :shippingaddress, :string
    remove_column :products, :shippingdate, :string
    remove_column :products, :condition, :string
    remove_column :products, :size, :string
    remove_column :products, :payer, :string
  end
end
