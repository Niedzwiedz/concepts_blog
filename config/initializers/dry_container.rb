# frozen_string_literal: true

Rails.application.config.to_prepare do
  Container.configure do |container|
    container.namespace("post") do |post_concept|
      post_concept.register("model", memoize: true) { Post::Model }
      post_concept.register("repository", memoize: true) do
        Post::Repository.new(adapter: container["post.model"])
      end

      post_concept.namespace("comment") do |comment_concept|
        comment_concept.register("model", memoize: true) { Post::Comment::Model }
        comment_concept.register("repository", memoize: true) do
          Post::Comment::Repository.new(adapter: container["post.comment.model"])
        end
      end
    end
  end
end
