class Product < ApplicationRecord
  extend FriendlyId

  friendly_id :slug_url, use: :slugged, slug_column: :slug_url

  belongs_to :category, class_name: "Category", foreign_key: "category_id"
  has_many :variants, class_name: "Variant"
end
