class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,         null: false
      t.string :image,        null: false
      t.text :content,        null: false
      t.integer :price,       null: false 
      t.integer :category,    null: false
      t.integer :status,      null: false
      t.integer :payment,     null: false
      t.integer :place,       null: false
      t.integer :days,        null: false
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
