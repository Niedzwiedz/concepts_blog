module Api
  module V1
    class PostsController < ApplicationController
      # TODO: introduce representers

      def create
        post = Post::UseCases::Create.call(params: post_params.to_h)
        render json: post
      end

      def show
        post = repository.one_for_id(params[:id])
        render json: post
      end

      private

      def repository
        Container.instance["post.repository"]
      end

      def post_params
        params.require(:post).permit(:id, :title, :author, :content)
      end
    end
  end
end
