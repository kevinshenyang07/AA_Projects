class TagTopic < ApplicationRecord

  def popular_links

    Taggings.where("tag_id = ?", self.id).joins(:short_url_id)
            .group("short_url")
  end

  belongs_to :taggings,
    class_name: :Tagging,
    primary_key: :id,
    foreign_key: :tag_id

  has_many :links,
    through: :taggings,
    source: :short_urls
end
