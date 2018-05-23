class CategorySerializer < ActiveModel::Serializer

  attributes :label, :state, :parent_id
  has_many :subcategories

end