class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres,through: :song_genres

  def slug
    name=self.name.downcase
    slugified_sentence=name.split(" ").collect do |word|
      word+="-"
    end.join("")

    # slugified_sentence.split("").pop
    slugified_sentence=slugified_sentence.split("")
    slugified_sentence.pop
    slugified_sentence.join("")
  end

  def self.find_by_slug(slug)
    unslug=slug.split("-").collect do |word|
      word.capitalize
    end
    name=unslug.join(" ")
    Song.find_by({name:name})
  end

end
