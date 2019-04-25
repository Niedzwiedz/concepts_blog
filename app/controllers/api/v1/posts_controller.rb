module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = post_repository.all.map do |post|
          Post::Representer.new(post, download_api_v1_post_url(post.id)).complete
        end

        render json: posts
      end

      def create
        post = Post::UseCases::Create.call(params: post_params.to_h)
        render json: Post::Representer.new(post, download_api_v1_post_url(post.id)).complete
      end

      def show
        post = post_repository.one_for_id(params[:id])
        render json: Post::Representer.new(post, download_api_v1_post_url(post.id)).complete
      end

      def download
        @post = post_repository.one_for_id(params[:id])
        @comments = comment_repository.all_for_post_id(params[:id])

        render xlsx: "post_#{@post.id}", template: Rails.root.join(*%w(app views posts download))
      end

      private

      def post_repository
        Container.instance["post.repository"]
      end

      def comment_repository
        Container.instance["post.comment.repository"]
      end

      def post_params
        params.require(:post).permit(:id, :title, :author, :content)
      end
    end
  end
end
