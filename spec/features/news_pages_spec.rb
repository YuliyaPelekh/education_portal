require 'spec_helper'

describe 'News pages' do
  subject { page }
  let(:news) { FactoryGirl.create(:news) }

  describe "index page" do
  	before do 
  	  FactoryGirl.create(:news) 
      FactoryGirl.create(:image, news_id: news.id) 
      visit news_index_path
    end

    it { should have_content('Новини') }
    it { should have_link(news.title)}
    it { should have_link("Читати далі")}
    it { should have_css("img[src*='images.jpeg']")}
    it { should have_content( news.created_at.strftime("%Y-%m-%d")) }
    it { should have_link('Створити новину', new_news_path)}
    it { should have_selector('p', news.text.truncate(300)) }

    describe "pagination" do

      before(:all) { 6.times { FactoryGirl.create(:news) } }
      after(:all)  { News.delete_all }

      it { should have_selector('div.pagination') }

      it "should list each news" do
        News.paginate(page: 1, per_page: 5).each do |news|
          expect(page).to have_content(news.text)
        end
      end
    end
  end

  describe 'create news' do
    describe 'with valid information' do
      before do
        visit news_index_path
        click_link 'Створити новину'
        fill_in 'Заголовок', with: news.title
        fill_in 'Текст', with: news.text
        click_button "Надіслати"
      end

      it { should have_selector('div.alert.alert-success', text: "Стаття збережена" ) }
      it { should have_content(news.title)}
      it { should have_content(news.text)}
      it { should have_content( news.created_at.strftime("%Y-%m-%d")) }
      it { should have_link('Відредагувати новину', edit_news_path(news))}
      it { should have_link('Видалити новину')}
      it { should have_link('Додати картинку')}
      it { should have_link('Назад до списку новин', news_index_path)}
    end 

    describe 'with invalid information' do
      before do
        visit new_news_path
        click_button "Надіслати"
      end
      it { should have_selector('div.alert.alert-error') }
    end
  end 

  describe 'destroy' do
    before { FactoryGirl.create(:image, news_id: news.id) }
    it "should destroy associated images" do
      images = news.images.to_a
      news.destroy 
      images.each do |image|
        expect(Image.where(id: image.id)).to be_empty
      end
    end
  end
end 