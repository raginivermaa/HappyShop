require 'rails_helper'

RSpec.describe Product, type: :model do
  it "has a valid slug url" do
    product = Product.create(name: 'Test Product', description: 'Hi', state: 'published')
    expect(product.slug_url).to eq('test-product')
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:description) }

  it do
    should validate_inclusion_of(:state).
        in_array(['draft', 'published', 'discontinued'])
  end


end

