class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.integer     :number,        null: false
      t.date        :expiredate,    nill: false
      t.integer     :securitycode,  null: false
      t.references  :user,          null: false,  foreign_key: true
      t.timestamps
    end
  end
end
