require "rails_helper"

RSpec.describe Post::Comment::UseCases::Create, type: :use_case do
  describe ".call" do
    let(:subject) { described_class.call(params: subject_params) }

    let(:subject_params) do
      {
        post_id: post_id,
        comment_id: comment_id,
        content: "some comment",
        commented_post_id: post.id
      }
    end

    let(:repository_params) do
      {
        content: "some comment",
        commented_post_id: post.id
      }
    end

    let(:post)       { create(:post) }

    let(:post_repository)    { container["post.repository"] }
    let(:comment_repository) { container["post.comment.repository"] }

    before do
      allow(repository)
        .to receive(:create_comment)
        .with(id: id, params: repository_params)
        .and_return(comment)
    end

    context "Comment for Post" do
      let(:post_id)    { post.id }
      let(:comment_id) { nil }
      let(:id) { post_id }

      let(:repository)       { post_repository }
      let(:commentable_type) { post.class.name }
      let(:commentable_id)   { post.id }

      let(:comment) do
        instance_double(
          "comment",
          repository_params.merge(
            id: 1,
            commentable_type: commentable_type,
            commentable_id: commentable_id
          )
        )
      end

      it "returns expected value" do
        expect(subject).to eq(comment)
      end

      it "calls repository" do
        expect(repository)
          .to receive(:create_comment)
          .with(id: id, params: repository_params)
          .and_return(comment)
        subject
      end
    end

    context "Comment for another Comment" do
      let(:existing_comment) do
        create(:comment, commentable_type: post.class.name, commentable_id: post.id)
      end

      let(:post_id)    { nil }
      let(:comment_id) { existing_comment.id }
      let(:id) { comment_id }

      let(:repository)       { comment_repository }
      let(:commentable_type) { existing_comment.class.name }
      let(:commentable_id)   { existing_comment.id }

      let(:comment) do
        instance_double(
          "comment",
          repository_params.merge(
            id: 1,
            commentable_type: commentable_type,
            commentable_id: commentable_id
          )
        )
      end

      it "returns expected value" do
        expect(subject).to eq(comment)
      end

      it "calls repository" do
        expect(repository)
          .to receive(:create_comment)
          .with(id: id, params: repository_params)
          .and_return(comment)
        subject
      end
    end
  end
end
