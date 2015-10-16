require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "login page" do
    before { visit login_path }

    it { should have_content('Зайти') }

    describe "with invalid information" do
      before { click_button "Ввійти" }
      it { should have_content('Зайти') }
      it { should have_selector('div.alert.alert-error') }
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Введіть email", with: user.email
        fill_in "Введіть пароль", with: user.password
        click_button "Ввійти"
      end

      it { should have_content(user.email) }
      it { should have_link('Вийти', href: logout_path) }
      it { should_not have_link('Зайти', href: login_path) }
      it { should_not have_selector('div.alert.alert-error') }

      describe "followed by signout" do
        before { click_link "Вийти" }
        it { should have_link('Зайти') }
      end
    end 
  end

  # describe "authorization", type: :request do

  #   describe "for non-signed-in users" do
  #     let(:user) { FactoryGirl.create(:user) }

  #     describe "when attempting to visit a protected page" do
  #       before do
  #         visit edit_user_path(user)
  #         fill_in "Email",    with: user.email
  #         fill_in "Password", with: user.password
  #         click_button "Sign in"
  #       end

  #       describe "after signing in" do

  #         it "should render the desired protected page" do
  #           expect(page).to have_title('Edit user')
  #         end
  #       # end
  #     end

      # describe "in the Relationships controller" do

      #   describe "submitting to the create action" do
      #     before { post relationships_path }
      #     specify { expect(response).to redirect_to(signin_path) }
      #   end

      #   describe "submitting to the destroy action" do
      #     before { delete relationship_path(1) }
      #     specify { expect(response).to redirect_to(signin_path) }
      #   end
      # end



  #    describe "as non-admin user" do
  #     let(:user) { FactoryGirl.create(:user) }
  #     let(:non_admin) { FactoryGirl.create(:user) }

  #     before { sign_in non_admin, no_capybara: true }

  #     describe "submitting a DELETE request to the Users#destroy action" do
  #       before { delete user_path(user) }
  #       specify { expect(response).to redirect_to(root_path) }
  #     end
  #   end
  # end
end