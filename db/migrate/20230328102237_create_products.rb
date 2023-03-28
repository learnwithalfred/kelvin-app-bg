class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :category, null: false, foreign_key: true
      t.references :campany, null: false, foreign_key: true
      t.string :name, null: false
      t.float :price, null: false
      t.text :description, null: false
      t.string :img, null: false

      t.timestamps
    end
  end
end
