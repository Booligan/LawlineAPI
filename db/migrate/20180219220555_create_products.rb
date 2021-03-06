class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, :precision => 16, :scale => 2
      t.string :image

      t.timestamps
    end
  end
end
