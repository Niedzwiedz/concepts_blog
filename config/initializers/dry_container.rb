# frozen_string_literal: true

Rails.application.config.to_prepare do
  Container.configure do |container|
    container.namespace("post") do |concept|
      concept.register("model", memoize: true) { Post::Model }
      concept.register("repository", memoize: true) do
        Post::Repository.new(adapter: container["post.model"])
      end
    end
  end
end
