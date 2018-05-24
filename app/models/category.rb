class Category < ApplicationRecord
  extend FriendlyId

  friendly_id :label, use: :slugged, slug_column: :slug_url

  scope :root, -> { where(parent_id: nil) }

  belongs_to :parent, class_name: "Category", required: false
  has_many :subcategories, class_name: "Category", foreign_key: :parent_id
  has_many :products

  validates :label, presence: true
  validates :state, presence: true
  validates :state, inclusion: { in: %w(draft published discontinued) }

  def descendents
    subcategories.map do |subcategory|
      [subcategory] + subcategory.descendents
    end.flatten
  end

end
