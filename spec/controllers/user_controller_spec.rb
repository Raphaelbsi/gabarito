# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '# Get /Users' do
    before(:each) do
      @users = create(:user, role: 0)
      get :index
    end
    it 'has a 200 status code' do
      expect(response.status).to eq(200)
    end
  end
end
