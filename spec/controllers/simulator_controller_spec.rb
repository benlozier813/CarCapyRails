require 'rails_helper'

RSpec.describe SimulatorController, type: :controller do

  describe "GET #create_car" do
    it "returns http success" do
      get :create_car
      expect(response).to have_http_status(:success)
    end
  end

end
