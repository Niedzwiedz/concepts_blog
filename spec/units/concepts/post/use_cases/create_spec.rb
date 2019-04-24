require "rails_helper"

RSpec.describe Post::UseCases::Create, type: :use_case do
  describe ".call" do
    let(:subject) { described_class.call(params: params) }

    let(:params) do
      {
        title: "Title",
        author: "Jim Moriarty",
        content: "IOU"
      }
    end

    let(:post)       { instance_double("post", params.merge(id: 1)) }
    let(:repository) { container["post.repository"] }

    before { allow(repository).to receive(:create!).with(params).and_return(post) }

    it "returns expected value" do
      expect(subject).to eq(post)
    end

    it "calls repository" do
      expect(repository).to receive(:create!).with(params).and_return(post)
      subject
    end
  end
end
