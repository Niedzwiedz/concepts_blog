# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::CommentsController, type: :controller do
  describe "GET #show" do
    subject(:show) { get :show, params: { id: comment.id } }

    let(:post)    { create(:post) }
    let(:comment) { create(:comment, commentable_type: post.class.name, commentable_id: post.id) }

    it "returns status 200" do
      show
      expect(response.status).to eq(200)
    end
  end
end
