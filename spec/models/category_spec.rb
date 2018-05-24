require 'rails_helper'

RSpec.describe Category, type: :model do
  it "has a valid slug url" do
    category = Category.create(label: 'Test Cat', state: 'published')
    expect(category.slug_url).to eq('test-cat')
  end

  it { should validate_presence_of(:label) }
  it { should validate_presence_of(:state) }
  #it { should allow_value('draft','published','discontinued'). for(:state) }

  it do
    should validate_inclusion_of(:state).
        in_array(['draft', 'published', 'discontinued'])
  end



end

