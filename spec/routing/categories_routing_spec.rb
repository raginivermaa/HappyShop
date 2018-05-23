require 'rails_helper'

describe "routes to CategoriesController" do

  let(:category_label) {'Test Cat'}
  let(:cat) {Category.create(label: category_label, state: 'public')}
  it {should route(:get, '/categories').to(action: :index)}
  it {should route(:get, '/categories/test-cat').to(action: :show, id: cat.slug_url)}

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

  describe "PUT 'update/:id'" do
    let(:new_category_label) {"new title"}

    it 'allows a category to be updated' do
      expect {
        put :update, params: {:id => cat.id, :category => cat.attributes = {:label => new_category_label}}
      }.to change {cat.label}.from(category_label).to(new_category_label)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new category" do

        expect{
          post :create, params: { category: FactoryBot.attributes_for(:category) }
        }.to change{Category.count}.by(1)
      end

      it "redirects to the new category" do
        post :create, params: { category: FactoryBot.attributes_for(:category) }
        response.should redirect_to Category.last
      end
    end

  end


end
