require 'rails_helper'

RSpec.describe "Articles", type: :system do

  before do
    driven_by(:rack_test)
  end
  let!(:user) { build(:user)}
  let!(:article) { create(:article) }
  describe 'ログイン前' do
    context 'indexページにアクセス' do
      it 'index article' do
        visit articles_path
        expect(page).to have_text("みんなの推し活コーデ")
      end
    end

    
    context 'コーデ投稿ページへ' do
      it 'new_article_path' do
        visit new_article_path
        expect(page).to have_text("ログイン")
      end
    end
  end

  describe 'ログイン後' do
    context 'コーデ投稿ページへ' do
      it 'new_article_path' do
        login(user)
        visit new_article_path
        expect(page).to have_text("コーデを投稿しよう！")
      end
    end
  end

end
