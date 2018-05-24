require 'rails_helper'

describe Api::V1::ProductsController, :type => :controller do

  let(:cat) {Category.create(label: 'Cat', state: 'published')}
  let(:product_name) {'Prod'}
  let(:prod) {Product.create(name: product_name, state: 'published', category: cat, description: 'Hi')}

  describe "GET 'index' " do
    it "returns a successful response" do
      get :index, format: :json
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns a successful response" do
      get :show, params: { id: prod.slug_url }, format: :json
      expect(response).to be_success
    end
  end

end



