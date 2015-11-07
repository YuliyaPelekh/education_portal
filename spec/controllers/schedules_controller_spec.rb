require 'rails_helper'

RSpec.describe SchedulesController, type: :controller do

describe "POST create" do 

  context "with valid attributes" do
  	it "creates a schedule with valid attributes" do
  	  expect{ 
  	 	post :create, schedule: FactoryGirl.attributes_for(:schedule) 
  	  }.to change(Schedule,:count).by(1) 
  	end  

  	 it "redirects to the timetables" do
      post :create, schedule: FactoryGirl.attributes_for(:schedule)
      expect(response).to redirect_to timetables_path
    end
  end

  context "with invalid attributes" do
  	it "does not save the schedule with invalid attributes" do
  	  expect{ 
  	    post :create, schedule: FactoryGirl.attributes_for(:invalid_schedule) 
  	  }.to_not change(Schedule,:count) 
  	end

  	it "re-renders the new method" do
      post :create, schedule: FactoryGirl.attributes_for(:invalid_schedule)
      expect(response).to render_template :new
    end    
  end
 end

 describe 'PUT update' do 
  	before :each do 
  	  @schedule = FactoryGirl.create(:schedule) 
  	end

    context 'with valid attributes' do
  	  it "changes @schedule attributes" do
  	    put :update, id: @schedule, 
  	    schedule: FactoryGirl.attributes_for(:schedule, lesson: "box", group: "second")
  	    @schedule.reload
  	    expect(@schedule.lesson).to eq("box") 
  	    expect(@schedule.group).to eq("second")
  	  end

  	  it "redirects to timetables" do
        put :update, id: @schedule, schedule: FactoryGirl.attributes_for(:schedule)
        expect(response).to redirect_to timetables_path
      end
    end

    context 'with invalid attributes' do 

  	  it "does not change @schedule attributes" do
  	    put :update, id: @schedule, 
  	    schedule: FactoryGirl.attributes_for(:invalid_schedule, lesson: "box")
  	    @schedule.reload
  	    expect(@schedule.lesson).to eq("painting") 
  	  end

  	  it "re-renders the edit method" do
        put :update, id: @schedule, schedule: FactoryGirl.attributes_for(:invalid_schedule)
        expect(response).to render_template :edit
      end
  	end
  end

  describe 'DELETE destroy' do

    it "deletes the schedule" do 
  	  @schedule = FactoryGirl.create(:schedule)
 	  expect{ 
 	    delete :destroy, id: @schedule 
 	  }.to change(Schedule,:count).by(-1) 
    end

    it 'renders timetables_path' do
      @schedule = FactoryGirl.create(:schedule)
      delete :destroy, id: @schedule 
      expect(response).to redirect_to timetables_path
    end 
  end 
end 
