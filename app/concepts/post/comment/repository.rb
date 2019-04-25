module Post
  module Comment
    class Repository
      # TODO: move delegators and initializer to Repostiory::Base and inherit

      delegate :all,     to: :adapter
      delegate :create,  to: :adapter
      delegate :create!, to: :adapter
      delegate :delete,  to: :adapter

      attr_reader :adapter

      def initialize(adapter: )
        @adapter = adapter
      end

      def one_for_id(id)
        adapter.find(id)
      end

      def all_for_comment_id(comment_id)
        adapter.where(commentable_id: comment_id)
      end

      def all_for_post_id(post_id)
        adapter.where(commented_post_id: post_id)
      end

      def create_comment(id:, params:)
        adapter
          .find(id)
          .comments
          .create!(params)
      end
    end
  end
end
