require 'spec_helper'

describe Album do

  before { @album = Album.new(title: "Adventure", description: 'Rbrbrbrbrbrbrbrbbrbr') }

  subject { @album}
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should be_valid }

  describe "when title is not present" do
    before { @album.title = " " }
    it { should_not be_valid }
  end

  describe "when description is not present" do
    before { @album.description = " " }
    it { should be_valid }
  end

  describe "when description is too short" do
    before { @album.description = "a" * 9 }
    it { should_not be_valid }
  end
end 
