require 'rails_helper'

RSpec.describe VariantsController, type: :routing do

  it 'should route to main list' do
    expect(
        get: '/variants'
    ).to route_to(controller: 'variants', action: 'index')
  end

  it 'routes to correct index' do
    expect(
        get: '/variants/some-variant'
    ).to route_to(controller: 'variants', action: 'show', id: 'some-variant')
  end

  it 'routes to new variant page' do
    expect(
        get: '/variants/new'
    ).to route_to(controller: 'variants', action: 'new')
  end

  it 'routes to edit variant page' do
    expect(
        get: 'variants/some-variant/edit'
    ).to route_to(controller: 'variants', action: 'edit', id: 'some-variant')
  end



end