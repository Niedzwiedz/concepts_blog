require "rails_helper"

RSpec.describe Post::Repository, type: :repository do
  subject { container["post.comment.repository"] }

  describe "#one_for_id" do
    subject { super().one_for_id(comment[:id]) }

    let(:post)    { create(:post) }
    let(:comment) { create(:comment, commentable_type: post.class.name, commentable_id: post.id) }

    it "returns one comment by id" do
      expect(subject).to eq(comment)
    end
  end

  describe "#create_comment" do
    subject { super().create_comment(id: comment[:id], params: params) }

    let(:post)    { create(:post) }
    let(:comment) { create(:comment, commentable_type: post.class.name, commentable_id: post.id) }
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
      expect(Post::Comment::Model.last.commentable_type).to eq("Post::Comment::Model")
    end
  end
end
