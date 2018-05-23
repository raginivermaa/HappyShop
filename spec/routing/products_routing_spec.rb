require 'rails_helper'

RSpec.describe ProductsController, type: :routing do

  it 'should route to main list' do
    expect(
        get: '/products'
    ).to route_to(controller: 'products', action: 'index')
  end

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