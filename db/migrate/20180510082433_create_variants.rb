class CreateVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :variants do |t|
      t.references :product, foreign_key: true, index: true

      t.string :name
      t.boolean :sold_out
      t.boolean :under_sale
      t.integer :price
      t.integer :sale_price
      t.string :sale_text

    end
  end
end
