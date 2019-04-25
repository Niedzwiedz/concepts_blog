# frozen_string_literal: true

module Post
  module Comment
    module UseCases
      class Create < ::UseCase::Base
        def persist
          repository.create_comment(
            id: commentable_id,
            params: params.except(:comment_id, :post_id)
          )
        end

        private

        def validation_schema
          Post::Comment::Validators::Create.call(params)
        end

        def repository
          if params[:comment_id]
            Container.instance["post.comment.repository"]
          elsif params[:post_id]
            Container.instance["post.repository"]
          end
        end

        def commentable_id
          params[:comment_id] || params[:post_id]
        end
      end
    end
  end
end
