require 'rails_helper'

RSpec.describe PicturesController, type: :controller do

before(:each) do
  @album = FactoryGirl.create(:album)
 
end 

describe "POST create" do 

  context "with valid attributes" do
  	it "creates a picture with valid attributes" do
  	  expect{ 
  	 	post :create, picture: FactoryGirl.attributes_for(:picture, album_id: @album.id ) 
  	  }.to change(Picture,:count).by(1) 
  	end
  end  


  context "with invalid attributes" do
  	it "does not save the picture with invalid attributes" do
  	  expect{ 
  	    post :create, picture: FactoryGirl.attributes_for(:invalid_picture) 
  	  }.to_not change(Picture,:count) 
  	end   
  end
 end

 
  describe 'DELETE destroy' do

    it "deletes the picture" do
     @picture = FactoryGirl.create(:picture, :album => @album) 
 	  expect{ 
 	    delete :destroy, id: @picture 
 	  }.to change(Picture,:count).by(-1) 
    end
  end 
end 