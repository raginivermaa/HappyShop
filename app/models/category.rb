class Category < ApplicationRecord
  extend FriendlyId

  friendly_id :label, use: :slugged, slug_column: :slug_url
  belongs_to :parent, class_name: "Category", required: false
  has_many :subcategories, class_name: "Category", foreign_key: :parent_id
  has_many :products

end
