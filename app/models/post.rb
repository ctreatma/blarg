class Post < ActiveRecord::Base
  validates_presence_of :title, :content, :slug
  acts_as_url :title, url_attribute: :slug

  def publish
    self.published_at ||= Time.now
  end

  def published?
    published_at.present?
  end

  def self.published
    where.not(published_at: nil)
  end
end
