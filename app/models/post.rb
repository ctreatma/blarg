class Post < ActiveRecord::Base
  validates_presence_of :title, :content, :slug
  acts_as_url :title, url_attribute: :slug
end
