class Song < ActiveRecord::Base
  belong_to :artists
  has_many :song_genres
  has_many :song_genres, :through : :song_genres

  def slug
    name.downcase.tr(" ","-")
  end

  def self.find_by_slug(slug)
    Song.all.find{|genre| artist.slug == slug}
  end
end
