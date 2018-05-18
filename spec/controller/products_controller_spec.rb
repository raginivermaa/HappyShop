require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

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

  describe "PUT 'update/:id'" do
    let(:new_product_name) {"new title"}
    it 'allows a product to be updated' do
      expect {
        put :update, params: {:id => prod.id, :product => prod.attributes = {:name => new_product_name}}
      }.to change {prod.name}.from(product_name).to(new_product_name)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      categoryC = FactoryBot.create(:category)
      productC = FactoryBot.create(:product)          # → model (saved)

      it "creates a new product" do
        expect{
          post :create, params: { product: productC.attributes }
        }.to change{Product.count}.by(1)
      end

      it "redirects to the new product" do
        post :create, params: { product: productC.attributes }
        response.should redirect_to Product.last
      end
    end

  end


end