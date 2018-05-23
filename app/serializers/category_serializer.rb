class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  def name
    names = object.name.split(" ")
    "#{names[0].first}. #{names[1][7]}"
  end


end