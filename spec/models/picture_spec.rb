require 'spec_helper'

describe Picture do

  before { @picture = Picture.new(avatar: File.new(Rails.root + 'spec/fixtures/images/images.jpeg'), album_id: 1) }

  subject { @picture}
  it { should respond_to(:avatar) }
  it { should respond_to(:album_id) }
  it { should be_valid }
end