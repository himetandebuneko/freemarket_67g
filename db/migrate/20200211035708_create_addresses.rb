class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :postcode,           null: false, default: ""
      t.string :prefectures,        null: false, default: ""
      t.string :city,               null: false, default: ""
      t.string :housenumber,        null: false, default: ""
      t.string :housename
      t.integer :phonenumber,       unique: true, default: ""
      t.references :user,           null: false, foreign_key: true
      t.string :prefecture_id,      null: false, default: ""
      t.timestamps
    end
  end
end
