module Post
  class Representer
    attr_reader :post, :url

    def initialize(post, url)
      @post = post
      @url  = url
    end

    def complete
      {
        id: post.id,
        title: post.title,
        author: post.author,
        content: post.content,
        link: url,
        comments: represented_comments
      }
    end

    private

    def represented_comments
      comment_repository.all_for_post_id(post.id) do |comment|
        Post::Comment::Representer.new(comment).basic
      end
    end

    def comment_repository
      Container.instance["post.comment.repository"]
    end
  end
end
