FactoryBot.define do

  factory :category do |c|
    sequence :label do |n|
      "Cat#{n}"
    end
    state "published"
  end

  factory :product do |p|
    sequence :name do |n|
      "Prod#{n}"
    end
    description "testProd"
    state "published"
    association :category, factory: :category
  end

  factory :variant do |v|
    sequence :name do |n|
      "Var#{n}"
    end
    sold_out false
    under_sale true
    price 1000
    sale_price 800
    sale_text "new sale"
    association :product, factory: :product
  end

end
