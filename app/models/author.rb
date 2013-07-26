class Author < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email
  has_many :posts
  def name
    self.first_name + " " + self.last_name
  end
end
