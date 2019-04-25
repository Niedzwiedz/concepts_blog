require "rails_helper"

RSpec.describe Post::Comment::Validators::Create, type: :schema do
  subject { described_class.call(params) }

  let(:params) do
    {
      content: content,
      commented_post_id: commented_post_id
    }
  end

  let(:content)           { "asdf" }
  let(:commented_post_id) { 1 }

  it { is_expected.to be_success }

  context "without content" do
    let(:content) { nil }

    it { is_expected.to be_failure }
  end

  context "without commented post id" do
    let(:commented_post_id) { nil }

    it { is_expected.to be_failure }
  end
end
