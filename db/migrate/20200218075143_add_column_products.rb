class AddColumnProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :shippingdate_id, :integer
    add_column :products, :size_id, :integer
    add_column :products, :payer_id, :integer
  end
end
