require 'rails_helper'

describe Api::V1::ProductsController, :type => :controller do

  let(:cat) {Category.create(label: 'Cat', state: 'public')}
  let(:product_name) {'Prod'}
  let(:prod) {Product.create(name: product_name, state: 'public', category: cat, description: 'Hi')}

  describe "GET 'index' " do
    it "returns a successful response" do
      get :index, format: :json
      expect(response).to be_success
    end
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
      let(:categoryC) { FactoryBot.create(:category) }
      # categoryC = FactoryBot.create(:category)
      let(:productC) { FactoryBot.create(:product) } # → model (saved)

      it "creates a new product" do
        expect {
          post :create, params: {product: productC.attributes}
        }.to change {Product.count}.by(1)
      end

      it "redirects to the new product" do
        post :create, params: {product: productC.attributes}
        response.should redirect_to Product.last
      end
    end

  end

end



