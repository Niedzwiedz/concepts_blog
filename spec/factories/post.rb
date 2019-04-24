FactoryBot.define do
  factory :post, class: "Post::Model" do
    title   { "Title" }
    author  { "Jim Moriarty" }
    content { "IOU" }

    initialize_with do
      Container.instance["post.model"].create!(attributes)
    end
  end
end
