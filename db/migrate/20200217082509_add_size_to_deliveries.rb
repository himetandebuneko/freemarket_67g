class AddSizeToDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :size_id, :integer
    add_column :deliveries, :size, :string
  end
end
