require 'spec_helper'

describe Timetable do

  before { @timetable = Timetable.new(day: 'monday') }

  subject { @timetable}
  it { should respond_to(:day) }
  it { should be_valid }

end