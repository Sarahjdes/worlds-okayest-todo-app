require 'rails_helper'

RSpec.describe "Todos", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "/todos"
      expect(response).to have_http_status(:success)
    end
  end

end
