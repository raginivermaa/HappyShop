class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|

      #t.references :parent, index: true, foreign_key: true
      t.integer :parent_id, index: true
      t.string :label, null: false
      t.string :slug_url
      t.string :state, null: false

    end
    add_foreign_key :categories, :categories, column: :parent_id, primary_key: :id

  end
end