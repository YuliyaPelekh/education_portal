require 'spec_helper'

describe "Static pages" do

subject { page }

  describe "Home page" do
    before { visit root_path }
    it { should have_content('Центр Раннього Розвитку') }
  end

  describe "Contact page" do
    before { visit contacts_path }
    it { should have_content('м.Львів, вул.Гординських, 4') }
  end
end