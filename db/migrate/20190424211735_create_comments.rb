class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.column :content, :text, null: false
      t.column :commentable_id, :integer, null: false
      t.column :commentable_type, :string, null: false
      t.column :commented_post_id, :integer, null: false
    end
  end
end
