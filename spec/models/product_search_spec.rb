require 'rails_helper'

RSpec.describe ProductSearch, type: :model do

  it "contains a list of all products when initialized" do
    product_search = ProductSearch.new
    expect(product_search.products).to eq(Product.all)
  end

  let(:cat) {Category.create(label: 'Cat', state: 'published')}
  let(:happy_elephant) {Product.create(name: 'Happy Elephant', state: 'published', category: cat, description: 'Hi')}
  let(:happy_cow) {Product.create(name: 'Happy Cow', state: 'published', category: cat, description: 'Hello')}
  let(:sad_monkey) {Product.create(name: 'Sad Monkey', state: 'published', category: cat, description: 'Hello')}
  let(:search) {{keywords: 'Happy'}}
  let(:sort_by) {'name'}

  it "returns a list of filtered by name" do
    product_search = ProductSearch.new
    product_search.search(search)
    expect(product_search.products.count.eql?(2))
  end


  it "returns a list of sorted by name" do
    product_search = ProductSearch.new
    product_search.sort_by(sort_by)
    expect(product_search.products == (product_search.products.order('name')))
  end



end

