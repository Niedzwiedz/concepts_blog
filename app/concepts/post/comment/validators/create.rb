# frozen_string_literal: true

module Post
  module Comment
    module Validators
      Create = Dry::Schema.Params do
        required(:content).filled
        required(:commented_post_id).filled
      end
    end
  end
end
