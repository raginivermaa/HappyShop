json.partial! "categories/category", category: @category


json.categories do |json|
  json.array! @categories, :id, :label, :state, :slug_url do |category|
    json.id category.id
    json.label category.label
    json.state category.state
    json.slug_url category.slug_url

    json.children category.subcategories do |sub_cat|
      json.id sub_cat.id
      json.label sub_cat.label
      json.state sub_cat.state
      json.slug_url sub_cat.slug_url

      json.children sub_cat.subcategories do |sub_cat_2|
        json.id sub_cat_2.id
        json.label sub_cat_2.label
        json.state sub_cat_2.state
        json.slug_url sub_cat_2.slug_url
      end
    end
  end
end