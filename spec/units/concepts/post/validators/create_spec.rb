require "rails_helper"

RSpec.describe Post::Validators::Create, type: :schema do
  subject { described_class.call(params) }

  let(:params) do
    {
      title: title,
      author: author,
      content: content
    }
  end

  let(:post)    { build(:post) }
  let(:title)   { post.title }
  let(:author)  { post.author }
  let(:content) { post.content }

  it { is_expected.to be_success }

  context "without title" do
    let(:title) { nil }

    it { is_expected.to be_failure }
  end

  context "without author" do
    let(:author) { nil }

    it { is_expected.to be_failure }
  end

  context "without content" do
    let(:content) { nil }

    it { is_expected.to be_failure }
  end
end
