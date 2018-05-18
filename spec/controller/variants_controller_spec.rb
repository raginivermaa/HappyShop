require 'rails_helper'

RSpec.describe VariantsController, type: :controller do

  let(:cat) {Category.create(label: 'Cat', state: 'public')}
  let(:product_name) {'Prod'}
  let(:prod) {Product.create(name: product_name, state: 'public', category: cat, description: 'Hi')}
  let(:var_name) {'Var'}
  let(:var){Variant.create(name: var_name, sold_out: 'false', under_sale: 'true', price: 400, sale_price: 300, product: prod)}
  it {should route(:get, '/variants').to(action: :index)}

  it {should route(:get, '/variants/var').to(action: :show, id: 'var')}

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

  describe "PUT 'update/:id'" do
    let(:new_variant_name) {"new title"}
    it 'allows a variant to be updated' do
      expect {
        put :update, params: {:id => var.id, :variant => var.attributes = {:name => new_variant_name}}
      }.to change {var.name}.from(var_name).to(new_variant_name)
    end
  end


  describe "POST create" do
    context "with valid attributes" do

      categoryC = FactoryBot.create(:category)
      productC = FactoryBot.create(:product)          # → model (saved)
      variantC = FactoryBot.create(:variant)

      it "creates a new variant" do
        expect{
          post :create, params: { variant: variantC.attributes }
        }.to change{Variant.count}.by(1)
      end

      it "redirects to the new variant" do
        post :create, params: { variant: variantC.attributes }
        response.should redirect_to Variant.last
      end
    end

  end


end