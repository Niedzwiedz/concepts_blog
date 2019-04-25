require "rails_helper"

RSpec.describe Post::Repository, type: :repository do
  subject { container["post.repository"] }

  describe "#one_for_id" do
    subject { super().one_for_id(post[:id]) }

    let(:post) { create(:post) }

    it "returns one post by id" do
      expect(subject).to eq(post)
    end
  end

  describe "#create_comment" do
    subject { super().create_comment(id: post[:id], params: params) }

    let(:post) { create(:post) }
    let(:params) do
      {
        content: "this is some comment",
        commented_post_id: post.id
      }
    end

    it "creates comment" do
      expect { subject }.to change { Post::Comment::Model.count }
    end

    it "creates comment with proper type" do
      subject
      expect(Post::Comment::Model.last.commentable_type).to eq("Post::Model")
    end
  end
end
