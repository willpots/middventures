class Post < ActiveRecord::Base
  attr_accessible :content, :title, :source_url, :permalink, :cover_image, :author_id, :created_at, :updated_at, :facebook_url, :twitter_url, :original_date
  belongs_to :author
  has_many :references
  has_many :tags, :through => :references
end
