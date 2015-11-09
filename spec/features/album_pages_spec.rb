require 'spec_helper'

describe 'Album pages' do
  subject { page }
  let(:album) { FactoryGirl.create(:album) }

  describe "index page" do
  	before do 
  	  FactoryGirl.create(:album) 
      FactoryGirl.create(:picture, album_id: album.id) 
      visit albums_path
    end

    it { should have_content('Галерея') }
    it { should have_content(album.description) }
    it { should have_link(album.title)}
    it { should have_css("img[src*='images.jpeg']")}
    it { should have_content( album.created_at.strftime("%d-%m-%Y")) }
    it { should have_link('Створити альбом', new_album_path)}
  end

  describe 'create album' do
    describe 'with valid information' do
      before do
        visit albums_path
        click_link 'Створити альбом'
        fill_in 'Назва альбому (максимум 15 символів)', with: album.title
        fill_in 'Опис альбому', with: album.description
        click_button "Надіслати"
      end

      it { should have_selector('div.alert.alert-success', text: "Альбом збережений" ) }
      it { should have_content(album.title)}
      it { should have_content(album.description)}
      it { should have_content( album.created_at.strftime("%Y-%m-%d")) }
      it { should have_link('Відредагувати опис альбому', edit_album_path(album))}
      it { should have_link('Видалити альбом')}
      it { should have_link('Додати зображення')}
      it { should have_link('Назад до альбомів', albums_path)}
    end 

    describe 'with invalid information' do
      before do
        visit new_album_path
        click_button "Надіслати"
      end
      it { should have_selector('div.alert.alert-error') }
    end
  end 

  describe 'destroy' do
    before { FactoryGirl.create(:picture, album_id: album.id) }
    it "should destroy associated pictures" do
      pictures = album.pictures.to_a
      album.destroy 
      pictures.each do |pic|
        expect(Picture.where(id: pic.id)).to be_empty
      end
    end
  end
end 