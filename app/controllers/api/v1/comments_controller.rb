module Api
  module V1
    class CommentsController < ApplicationController
      def index
        comments = repository.all_for_comment_id(params[:comment_id])
        render json: comments.map { |comment| Post::Comment::Representer.new(comment).complete }
      end

      def create
        comment = Post::Comment::UseCases::Create.call(params: params_with_ids)
        render json: Post::Comment::Representer.new(comment).complete
      end

      def show
        comment = repository.one_for_id(params[:id])
        render json: Post::Comment::Representer.new(comment).complete
      end

      private

      def repository
        Container.instance["post.comment.repository"]
      end

      def params_with_ids
        comment_params.to_h.merge({ post_id: params[:post_id], comment_id: params[:comment_id] })
      end

      def comment_params
        params.require(:comment).permit(:id, :content, :commented_post_id)
      end
    end
  end
end
