require 'spec_helper'

describe News do

  before { @news = News.new(title: "Adventure", text: 'Rbrbrbrbrbrbrbrbbrbr') }

  subject { @news}
  it { should respond_to(:title) }
  it { should respond_to(:text) }
  it { should be_valid }

  describe "when title is not present" do
    before { @news.title = " " }
    it { should_not be_valid }
  end

  describe "when text is not present" do
    before { @news.text = " " }
    it { should_not be_valid }
  end

  describe "when title is too short" do
    before { @news.title = "a" * 3 }
    it { should_not be_valid }
  end

  describe "when text is too short" do
    before { @news.text = "a" * 9 }
    it { should_not be_valid }
  end
end 
