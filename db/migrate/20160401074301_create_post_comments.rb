class CreatePostComments < ActiveRecord::Migration
  def change
    create_table :post_comments do |t|
      t.string :name
      t.string :email
      t.string :content

      t.timestamps null: false
    end
  end
end
