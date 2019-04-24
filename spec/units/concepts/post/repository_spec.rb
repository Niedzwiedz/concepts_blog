require "rails_helper"

RSpec.describe Post::Repository, type: :repository do
  describe "#one_for_id" do
    subject { container["post.repository"].one_for_id(post[:id]) }

    let(:post) { create(:post) }

    it "returns one post by id" do
      expect(subject).to eq(post)
    end
  end
end
