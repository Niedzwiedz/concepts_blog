# frozen_string_literal: true

module Post
  module Validators
    Create = Dry::Schema.Params do
      required(:title).filled
      required(:author).filled
      required(:content).filled
    end
  end
end

