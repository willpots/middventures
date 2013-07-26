class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :references
  has_many :posts, :through => :references
end
