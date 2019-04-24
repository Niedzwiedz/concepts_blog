# frozen_string_literal: true

module Post
  module UseCases
    class Create < ::UseCase::Base
      def persist
        repository.create!(params)
      end

      private

      def validation_schema
        Post::Validators::Create.call(params)
      end

      def repository
        Container.instance["post.repository"]
      end
    end
  end
end
