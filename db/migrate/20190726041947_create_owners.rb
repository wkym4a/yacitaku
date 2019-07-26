class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :name , null: false
      t.string :name_kana , null: false
      t.string :post_code , null: false
      t.string :address , null: false
      t.string :tel , null: false
      t.string :tel2 , null: false
      t.string :fax , null: false
      t.string :property_name , null: false
      t.string :property_name_kana , null: false
      t.string :property_post_code , null: false
      t.string :property_address , null: false
      t.string :property_type , null: false
      t.string :bank , null: false
      t.string :branch , null: false
      t.integer :account_type , null: false , default: 0
      t.string :account_num , null: false
      t.string :account_name , null: false
      t.text :memo , null: false

      t.timestamps
    end
  end
end
