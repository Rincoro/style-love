require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "validation_chack" do
    comment = build(:comment)
    expect(comment).to be_valid
    expect(comment.errors).to be_empty
  end

  it "body-presence true" do
    comment = build(:comment)
    comment.body = nil
    comment. valid?
    expect(comment.errors[:body]).to include("を入力してください")
  end
end
