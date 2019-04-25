module Post
  module Comment
    class Representer
      attr_reader :comment

      def initialize(comment)
        @comment = comment
      end

      def complete
        comment.to_json
      end

      def basic
        {
          id: comment.id,
          content: comment.content
        }
      end
    end
  end
end
