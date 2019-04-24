# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::PostsController, type: :controller do
  describe "GET #show" do
    subject(:show) { get :show, params: params }

    let(:post) { create(:post) }

    let(:params) do
      {
        id: post.id
      }
    end

    it "returns status 200" do
      show
      expect(response.status).to eq(200)
    end
  end
end
