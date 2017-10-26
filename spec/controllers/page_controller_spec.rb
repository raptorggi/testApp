require 'rails_helper'

describe PageController, type: :controller do
  describe "show" do
    it "responce successfully" do
      create :page, slug: 'page-1'
      get :show, params: {slug: 'page-1'}
      expect(response).to render_template("show")
    end 
  end
end
