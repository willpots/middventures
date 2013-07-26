class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :source_url
      t.string :permalink
      t.string :cover_image
      t.string :linked_in_url
      t.string :facebook_url
      t.string :twitter_url
      t.string :original_date
      t.references :author


      t.timestamps
    end

    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.timestamps
    end

    create_table :tags do |t|
      t.string :name
      t.timestamps
    end

  end
end
