require 'rails_helper'

RSpec.describe ImagesController, type: :controller do

before(:each) do
  @news = FactoryGirl.create(:news)
 
end 

describe "POST create" do 

  context "with valid attributes" do
  	it "creates an image with valid attributes" do
  	  expect{ 
  	 	post :create, image: FactoryGirl.attributes_for(:image, news_id: @news.id ) 
  	  }.to change(Image,:count).by(1) 
  	end
  end  


  context "with invalid attributes" do
  	it "does not save the image with invalid attributes" do
  	  expect{ 
  	    post :create, image: FactoryGirl.attributes_for(:invalid_image) 
  	  }.to_not change(Image,:count) 
  	end   
  end
 end

 
  describe 'DELETE destroy' do

    it "deletes the image" do
     @image = FactoryGirl.create(:image, :news => @news) 
 	  expect{ 
 	    delete :destroy, id: @image 
 	  }.to change(Image,:count).by(-1) 
    end
  end 
end 