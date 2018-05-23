class ProductSerializer < ActiveModel::Serializer

  attributes :name, :state, :description, :category
  has_many :variants

end