# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::PostsController, type: :controller do
  describe "GET #show" do
    subject(:show) { get :show, params: { id: post.id } }

    let(:post) { create(:post) }

    it "returns status 200" do
      show
      expect(response.status).to eq(200)
    end
  end

  describe "POST #create" do
    subject(:create) { post :create, params: { post: params } }

    let(:params) do
      {
        title: "IOU",
        author: "Jim Moriarty",
        content: "some content"
      }
    end

    it "returns status 200" do
      create
      expect(response.status).to eq(200)
    end
  end
end
