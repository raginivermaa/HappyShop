require 'rails_helper'

describe Api::V1::CategoriesController, :type => :controller do

  let(:category_label) {'Test Cat'}
  let(:cat) {Category.create(label: category_label, state: 'published')}

  describe "GET 'index' " do
    it "returns a successful response" do
      get :index, format: :json
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns a successful response" do
      get :show, params: { id: cat.slug_url }, format: :json
      expect(response).to be_success
    end
  end

end



