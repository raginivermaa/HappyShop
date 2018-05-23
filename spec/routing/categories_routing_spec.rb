require 'rails_helper'

describe 'routes to CategoriesController' do

  it 'should route to main list' do
    expect(
      get: '/categories'
    ).to route_to(controller: 'categories', action: 'index')
  end

  it 'routes to correct index' do
    expect(
        get: '/categories/some-category'
    ).to route_to(controller: 'categories', action: 'show', id: 'some-category')

    expect(
        get: '/categories/parent1/some-category'
    ).to route_to(controller: 'categories', action: 'show', id: 'parent1/some-category')

    expect(
        get: '/categories/parent1/parent2/some-category'
    ).to route_to(controller: 'categories', action: 'show', id: 'parent1/parent2/some-category')
  end

  it 'routes to new category page' do
    expect(
        get: '/categories/new'
    ).to route_to(controller: 'categories', action: 'new')
  end

  it 'routes to edit category page' do
    expect(
        get: '/categories/some-category/edit'
    ).to route_to(controller: 'categories', action: 'edit', id: 'some-category')
  end

  it 'routes to edit category page' do
    expect(
        patch: '/categories/1'
    ).to route_to(controller: 'categories', action: 'update', id: '1')
  end



end
