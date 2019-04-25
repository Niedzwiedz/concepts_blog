module Post
  module Comment
    class Model < ApplicationRecord
      self.table_name = :comments

      belongs_to :commentable, class_name: "Post::Comment::Model", polymorphic: true
      has_many :comments, class_name: "Post::Comment::Model", as: :commentable
    end
  end
end
