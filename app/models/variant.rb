class Variant < ApplicationRecord
  belongs_to :product, class_name: "Product", foreign_key: "product_id"


  validates :name, presence: true
  validates :sold_out, inclusion: { in: [true,false]}
  validates :under_sale, inclusion: { in: [true,false]}
  validates :price, presence: true

  validates :sale_price, presence: true, if: :under_sale
  validates :sale_price, numericality: {less_than: :price}, if: :under_sale


end
