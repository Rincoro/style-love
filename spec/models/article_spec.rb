require 'rails_helper'
RSpec.describe Article, type: :model do
  it "validation_chack" do
    article = build(:article)
      expect(article).to be_valid
      expect(article.errors).to be_empty
  end



  it "title&oshi_pointl-presence true" do
    article = build(:article)
    article.title = nil
    article.oshi_point = nil
    article.valid?
    expect(article.errors[:title]).to include("を入力してください")
    expect(article.errors[:oshi_point]).to include("を入力してください")
  end

  it "image-presence true" do
    article = build(:article)
    article.image = nil
    article.valid?
    expect(article.errors[:image]).to include("を入力してください")
  end

  it "category-presence true" do
    article = build(:article)
    article.category = nil
    article.valid? 
    expect(article.errors[:category]).to include("選択してください")
  end

  it "color-presence true" do
    article = build(:article)
    article.color = nil
    article.valid? 
    expect(article.errors[:color]).to include("選択してください")
  end
end