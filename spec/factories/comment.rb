FactoryBot.define do
  factory :comment, class: "Post::Comment::Model" do
    content           { "IOU" }
    commented_post_id { 1 }

    initialize_with do
      Container.instance["post.comment.model"].create!(attributes)
    end
  end
end
