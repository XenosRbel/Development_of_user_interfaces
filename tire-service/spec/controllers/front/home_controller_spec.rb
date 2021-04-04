# frozen_string_literal: true

require "rails_helper"

RSpec.describe Front::HomeController, type: :controller do
  routes { Front::Engine.routes }

  describe "GET #show" do
    let(:send_request) { get :index }

    it "responds with status ok" do
      send_request
      expect(response).to have_http_status(:ok)
    end
  end
end
