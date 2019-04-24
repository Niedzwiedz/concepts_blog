# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.column :title, :string, null: false
      t.column :author, :string, null: false
      t.column :content, :text, null: false
    end
  end
end
