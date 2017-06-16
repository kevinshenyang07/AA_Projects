class Tagging < ApplicationRecord

  has_many :short_urls,
    class_name: :ShortenedUrl,
    primary_key: :id,
    foreign_key: :short_url_id

end
