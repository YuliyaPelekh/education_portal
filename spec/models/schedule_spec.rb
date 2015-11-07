require 'spec_helper'

describe Schedule do

  before { @schedule = Schedule.new(timetable_id: 1, hours: Time.new(2000,1,1,20,30,0), group: 'group', lesson: 'painting') }

  subject { @schedule}
  it { should respond_to(:timetable_id) }
  it { should respond_to(:hours) }
  it { should respond_to(:lesson) }
  it { should respond_to(:group) }
  it { should be_valid }

  describe "when hours is not present" do
    before { @schedule.hours = " " }
    it { should_not be_valid }
  end

  describe "when group is not present" do
    before { @schedule.group = " " }
    it { should_not be_valid }
  end

  describe "when lesson is not present" do
    before { @schedule.lesson = " " }
    it { should_not be_valid }
  end
end 