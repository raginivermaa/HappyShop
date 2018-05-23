require 'rails_helper'

describe "routes to ProductsController" do

  let(:cat) {Category.create(label: 'Cat', state: 'public')}
  let(:product_name) {'Prod'}
  let(:prod) {Product.create(name: product_name, state: 'public', category: cat, description: 'Hi')}
  it {should route(:get, '/products').to(action: :index)}

  it {should route(:get, '/products/prod').to(action: :show, id: :prod)}

  it 'routes to correct index' do
    expect(
        get: '/products/some-product'
    ).to route_to(controller: 'products', action: 'show', id: 'some-product')
  end

  it 'routes to new product page' do
    expect(
        get: '/products/new'
    ).to route_to(controller: 'products', action: 'new')
  end

  it 'routes to edit product page' do
    expect(
        get: 'products/some-product/edit'
    ).to route_to(controller: 'products', action: 'edit', id: 'some-product')
  end




end