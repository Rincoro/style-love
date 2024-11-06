require 'rails_helper'

RSpec.describe Item, type: :model do
  it "validation_chack" do
    item = build(:item)
    expect(item).to be_valid
    expect(item.errors).to be_empty
  end
end
