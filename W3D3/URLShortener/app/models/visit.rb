class Visit < ApplicationRecord

  def self.record_visit!(user, shortened_url)
    Visit.create({user_id: user.id, short_url_id: shortened_url.id })
  end

  belongs_to :users,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  belongs_to :short_urls,
    class_name: :ShortenedUrl,
    primary_key: :id,
    foreign_key: :short_url_id

  validates :user_id, :short_url_id, presence: true

end
