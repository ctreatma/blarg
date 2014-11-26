class SocialLink < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :account_id, :base_url, :site, :user

  def url
    "#{base_url}/#{account_id}" if base_url.present?
  end

private

  def base_url
    Rails.configuration.base_urls[site] if site.present?
  end
end
