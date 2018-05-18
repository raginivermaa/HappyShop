class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.references :category, foreign_key: true, index: true
      #t.bigint : category_id, index: true
      t.string :name, null: false
      t.string :slug_url, null: false
      t.string :description, null: false
      t.string :state, null: false

    end
    #add_foreign_key :products, :categories, column: :category_id, primary_key: :id



  end
end