# frozen_string_literal: true

module Post
  class Model < ApplicationRecord
    self.table_name = :posts

    has_many :comments, class_name: "Post::Comment::Model", as: :commentable
  end
end
