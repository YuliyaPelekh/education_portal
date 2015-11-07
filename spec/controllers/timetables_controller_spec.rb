require 'rails_helper'

RSpec.describe TimetablesController, type: :controller do
	
  describe "GET #index" do

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

end
