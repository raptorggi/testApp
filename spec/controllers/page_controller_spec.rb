require 'rails_helper'

describe PageController, type: :controller do
  describe "show" do
    it "render template" do
      create :page, slug: 'page-1'
      get :show, params: {slug: 'page-1'}
      expect(response).to render_template("show")
    end 
    it "returns a 200 status code" do 
      create :page, slug: 'page-1'
      get :show, params: {slug: 'page-1'}
      expect(response).to have_http_status(200)
    end
    it "returns requested page" do
      p = create :page, slug: 'page-1'
      get :show, params: {slug: 'page-1'}
      expect(assigns(:page).id).to eq(p.id) 
    end
  end
end
