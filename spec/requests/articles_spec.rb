require 'rails_helper'

RSpec.describe "Articles", type: :system do
  before do
    driven_by(:rack_test)
  end
  let!(:user) { build(:user) }
  let!(:article) { create(:article) }
  describe 'ログイン前' do
    context 'コーデ投稿ページへ' do
      it 'new_article_path' do
        visit new_article_path
        expect(page).to have_text("ログイン")
      end
    end

    context 'コーデ詳細ページへ' do
      it 'show' do
        visit article_path(article)
        expect(page).to have_text("ログイン")
      end
    end
  end

  describe 'ログイン後' do
    context 'コーデ投稿ページへ' do
      it 'new_article_path' do
        login(user)
        visit new_article_path
        expect(page).to have_text("推しのジャンルを決めよう！")
      end
    end

    context 'コーデ詳細ぺージへ' do
      it 'show' do
        login(user)
        visit article_path(article)
        expect(page).to have_text("編集")
      end
    end
  end
end
