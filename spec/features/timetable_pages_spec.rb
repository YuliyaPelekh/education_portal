require 'spec_helper'

describe 'Timetable pages' do
  subject { page }
  let(:timetable) { FactoryGirl.create(:timetable) }
  let(:schedule) { FactoryGirl.create(:schedule) }

  describe "index page" do
  	before do 
  	  FactoryGirl.create(:timetable) 
        visit timetables_path
        click_link 'Створити новий запис'
        fill_in 'schedule_hours', with: Time.new(2000,1,1,20,30,0)
        fill_in 'Введіть назву групи', with: schedule.group
        fill_in 'Введіть назву уроку', with: schedule.lesson
        click_button "Надіслати"
      end
      it { should have_content(timetable.day) }
      it { should have_selector('div.alert.alert-success', text: "Запис збережений" ) }
      it { should have_content(schedule.group)}
      it { should have_content(schedule.lesson)}
      it { should have_content(Time.new(2000,1,1,20,30,0).strftime("%H:%M")) }
      it { should have_link('Відредагувати')}
      it { should have_link('Видалити')}
    end 

    describe 'with invalid information' do
      before do
        visit new_schedule_path
        click_button "Надіслати"
      end
      it { should have_selector('div.alert.alert-error') }
    end
  

  describe 'destroy' do
    before { FactoryGirl.create(:schedule, timetable_id: timetable.id) }
    it "should destroy associated pictures" do
      schedules = timetable.schedules.to_a
      timetable.destroy 
      schedules.each do |pic|
        expect(Schedule.where(id: pic.id)).to be_empty
      end
    end
  end
end 