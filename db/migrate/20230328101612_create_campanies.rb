class CreateCampanies < ActiveRecord::Migration[7.0]
  def change
    create_table :campanies do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :campanies, :name, unique: true
  end
end
