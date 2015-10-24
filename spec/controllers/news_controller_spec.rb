require 'rails_helper'

RSpec.describe NewsController, type: :controller do

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
      get :show, id: FactoryGirl.create(:news)
      expect(response).to render_template :show
    end   
  end

describe "POST create" do 

  context "with valid attributes" do
  	it "creates a news with valid attributes" do
  	  expect{ 
  	 	post :create, news: FactoryGirl.attributes_for(:news) 
  	  }.to change(News,:count).by(1) 
  	end  

  	 it "redirects to the news" do
      post :create, news: FactoryGirl.attributes_for(:news)
      expect(response).to redirect_to News.last
    end
  end

  context "with invalid attributes" do
  	it "does not save the news with invalid attributes" do
  	  expect{ 
  	    post :create, news: FactoryGirl.attributes_for(:invalid_news) 
  	  }.to_not change(News,:count) 
  	end

  	it "re-renders the new method" do
      post :create, news: FactoryGirl.attributes_for(:invalid_news)
      expect(response).to render_template :new
    end    
  end
 end

 describe 'PUT update' do 
  	before :each do 
  	  @news = FactoryGirl.create(:news) 
  	end

    context 'with valid attributes' do
  	  it "changes @news attributes" do
  	    put :update, id: @news, 
  	    news: FactoryGirl.attributes_for(:news, title: "School", text: "Kukukukukuku")
  	    @news.reload
  	    expect(@news.title).to eq("School") 
  	    expect(@news.text).to eq("Kukukukukuku")
  	  end

  	  it "redirects to the updated news" do
        put :update, id: @news, news: FactoryGirl.attributes_for(:news)
        expect(response).to redirect_to @news
      end
    end

    context 'with invalid attributes' do 

  	  it "does not change @news attributes" do
  	    put :update, id: @news, 
  	    news: FactoryGirl.attributes_for(:invalid_news)
  	    @news.reload
  	    expect(@news.title).to eq("Rainbow") 
  	    expect(@news.text).to eq("Huguguguguguguugugugug")
  	  end

  	  it "re-renders the edit method" do
        put :update, id: @news, news: FactoryGirl.attributes_for(:invalid_news)
        expect(response).to render_template :edit
      end
  	end
  end

  describe 'DELETE destroy' do

    it "deletes the news" do 
  	  @news = FactoryGirl.create(:news)
 	  expect{ 
 	    delete :destroy, id: @news 
 	  }.to change(News,:count).by(-1) 
    end

    it 'renders news_index_path' do
      @news = FactoryGirl.create(:news)
      delete :destroy, id: @news 
      expect(response).to redirect_to news_index_path
    end 
  end 
end 