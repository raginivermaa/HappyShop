require 'rails_helper'

RSpec.describe Variant, type: :model do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }

  it do
    should validate_inclusion_of(:sold_out).
        in_array([true, false])
  end
  it do
    should validate_inclusion_of(:under_sale).
        in_array([true, false])
  end

  it "should have sale_price if on sale" do

    cat = Category.create(label: 'Cat', state: 'published')
    product = Product.create(name: 'Prod', state: 'published', description: 'test', category: cat)

    variant1 = Variant.create(name: 'newVariant', sold_out: 'false', under_sale: 'true', price: 400, sale_price: 300, product: product)
    expect(variant1).to be_valid

    variant2 = Variant.create(name: 'newVariant2', sold_out: 'false', under_sale: 'true', price: 400, product: product)
    expect(variant2).to be_invalid
  end

  scenario "sale_price should be less than original price" do
    cat = Category.create(label: 'Cat', state: 'published')
    product = Product.create(name: 'Prod', state: 'published', description: 'test', category: cat)
    variant = Variant.create(name: 'newVariant', sold_out: 'false', under_sale: 'true', price: 400, sale_price: 500, product: product)
    expect(variant).to be_invalid
  end


end

