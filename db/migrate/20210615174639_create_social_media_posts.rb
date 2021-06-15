class CreateSocialMediaPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :social_media_posts do |t|
      t.string :message
      t.string :featured_image
      t.integer :likes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
