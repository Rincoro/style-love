require 'rails_helper'

RSpec.describe User, type: :model do
  it "validation_chack" do
    user = build(:user)
      expect(user).to be_valid
      expect(user.errors).to be_empty
  end

  it "email-uniqe" do
    user1 = create(:user)
    user2 = build(:user)
    user1.email = user2.email
    user2.valid?
    expect(user2.errors[:email]).to include("はすでに存在します")
  end

  it "name&email-presence" do
    user = build(:user)
    user.email = nil
    user.name = nil
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
    expect(user.errors[:name]).to include("を入力してください")
  end
end
