require 'spec_helper'

describe Image do

  before { @image = Image.new(name: "Adventure", avatar: File.new(Rails.root + 'spec/fixtures/images/images.jpeg'), news_id: 1) }

  subject { @image}
  it { should respond_to(:name) }
  it { should respond_to(:avatar) }
  it { should respond_to(:news_id) }
  it { should be_valid }

end
