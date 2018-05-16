class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.references :category, foreign_key: true, index: true
      #t.bigint : category_id, index: true
      t.string :name
      t.string :slug_url
      t.string :description
      t.string :state

    end
    #add_foreign_key :products, :categories, column: :category_id, primary_key: :id



  end
end