require_relative 'visit'
require 'securerandom'

class ShortenedUrl < ApplicationRecord

  def self.random_code
    code = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(:short_url => code)
      code = SecureRandom.urlsafe_base64
    end
    code
  end

  def self.create_short_url(user, long_url)
    short_url = ShortenedUrl.random_code
    url_obj = ShortenedUrl.create(user_id: user.id,long_url: long_url,short_url: short_url)
    url_obj.save!
    url_obj
  end

  def num_clicks
    # self.visits.count
    Visit.where(short_url_id: self.id).count
  end

  def num_uniques
    # visitor_ids = self.visitors.map { |visitor| visitor.id }
    # visitor_ids.uniq.count
    Visit.where(short_url_id: self.id).select(:user_id).distinct.count
  end

  def num_recent_uniques
    Visit.where(short_url_id: self.id)
         .where("updated_at > ?", 10.minutes.ago)
         .select(:user_id).distinct.count
  end

  belongs_to :submitter,
  class_name: :User,
  primary_key: :id,
  foreign_key: :user_id

  has_many :visits,
    class_name: :Visit,
    primary_key: :id,
    foreign_key: :short_url_id

  has_many :visitors,
    through: :visits,
    source: :users


  validates :short_url, :presence => true, :uniqueness => true
  validates :long_url, :presence => true, :uniqueness => true

end
