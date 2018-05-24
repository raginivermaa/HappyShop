require 'rails_helper'

describe CategoriesController, :type => :controller do

  let(:category_label) {'Test Cat'}
  let(:cat) {Category.create(label: category_label, state: 'published')}


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

        expect {
          post :create, params: {category: FactoryBot.attributes_for(:category)}
        }.to change {Category.count}.by(1)
      end

      it "redirects to the new category" do
        post :create, params: {category: FactoryBot.attributes_for(:category)}
        response.should redirect_to Category.last
      end
    end

  end


end



