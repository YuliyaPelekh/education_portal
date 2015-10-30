require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

  describe "GET #index" do

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end
  
  describe "GET #show" do 

    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:album)
      expect(response).to render_template :show
    end   
  end

describe "POST create" do 

  context "with valid attributes" do
  	it "creates an album with valid attributes" do
  	  expect{ 
  	 	post :create, album: FactoryGirl.attributes_for(:album) 
  	  }.to change(Album,:count).by(1) 
  	end  

  	 it "redirects to the album" do
      post :create, album: FactoryGirl.attributes_for(:album)
      expect(response).to redirect_to Album.last
    end
  end

  context "with invalid attributes" do
  	it "does not save the album with invalid attributes" do
  	  expect{ 
  	    post :create, album: FactoryGirl.attributes_for(:invalid_album) 
  	  }.to_not change(Album,:count) 
  	end

  	it "re-renders the new method" do
      post :create, album: FactoryGirl.attributes_for(:invalid_album)
      expect(response).to render_template :new
    end    
  end
 end

 describe 'PUT update' do 
  	before :each do 
  	  @album = FactoryGirl.create(:album) 
  	end

    context 'with valid attributes' do
  	  it "changes @album attributes" do
  	    put :update, id: @album, 
  	    album: FactoryGirl.attributes_for(:album, title: "School", description: "Kukukukukuku")
  	    @album.reload
  	    expect(@album.title).to eq("School") 
  	    expect(@album.description).to eq("Kukukukukuku")
  	  end

  	  it "redirects to the updated album" do
        put :update, id: @album, album: FactoryGirl.attributes_for(:album)
        expect(response).to redirect_to @album
      end
    end

    context 'with invalid attributes' do 

  	  it "does not change @album attributes" do
  	    put :update, id: @album, 
  	    album: FactoryGirl.attributes_for(:invalid_album)
  	    @album.reload
  	    expect(@album.title).to eq("Rainbow") 
  	    expect(@album.description).to eq(nil)
  	  end

  	  it "re-renders the edit method" do
        put :update, id: @album, album: FactoryGirl.attributes_for(:invalid_album)
        expect(response).to render_template :edit
      end
  	end
  end

  describe 'DELETE destroy' do

    it "deletes the album" do 
  	  @album = FactoryGirl.create(:album)
 	  expect{ 
 	    delete :destroy, id: @album 
 	  }.to change(Album,:count).by(-1) 
    end

    it 'renders album_index_path' do
      @album = FactoryGirl.create(:album)
      delete :destroy, id: @album 
      expect(response).to redirect_to albums_path
    end 
  end 
end 
