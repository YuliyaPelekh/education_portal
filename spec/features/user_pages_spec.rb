require 'spec_helper'

describe 'User pages' do
  subject { page }

  describe "signup page" do
    before { visit signup_path }
    let(:submit) { "Створити мій аккаунт" }

    it { should have_content('Зареєструватися') }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
      	fill_in "Введіть ім'я",       with: "Наталя"
        fill_in "Введіть прізвище",   with: "Клочун"
        fill_in "Введіть електронну пошту",        with: "user@example.com"
        fill_in "Введіть пароль",     with: "foobar"
        fill_in "Підтвердіть пароль", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Вийти') }
        it { should have_content(user.email) }
        it { should have_selector('div.alert.alert-success', text: "Ласкаво просимо!") }
      end
    end
  end  
end