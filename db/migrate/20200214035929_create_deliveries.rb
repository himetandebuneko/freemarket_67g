class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :day_id
      t.string :day
      t.integer :fee_id
      t.string :fee

      t.timestamps
    end
  end
end
