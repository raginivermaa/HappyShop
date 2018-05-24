require 'rails_helper'

RSpec.describe Api::V1::CategoriesController, type: :routing do

  let(:category_label) {'Test Cat'}
  let(:cat) {Category.create(label: category_label, state: 'published')}
  it {should route(:get, '/api/v1/categories').to(action: :index, controller: 'api/v1/categories')}
  it {should route(:get, '/api/v1/categories/test-cat').to(action: :show, id: cat.slug_url, controller: 'api/v1/categories')}

  it 'routes to correct index (direct categories)' do
    expect(
        get: '/api/v1/categories/some-category'
    ).to route_to(controller: 'api/v1/categories', action: 'show', id: 'some-category')
  end

  it 'routes to correct hierarchy index (1 level)' do
    expect(
        get: '/api/v1/categories/parent1/some-category'
    ).to route_to(controller: 'api/v1/categories', action: 'show', id: 'parent1/some-category')
  end

  it 'routes to correct hierarchy index (2 levels)' do
    expect(
        get: '/api/v1/categories/parent1/parent2/some-category'
    ).to route_to(controller: 'api/v1/categories', action: 'show', id: 'parent1/parent2/some-category')
  end



end
