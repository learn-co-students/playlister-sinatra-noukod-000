class SongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres, id: false do |t|
      t.belongs_to :genre
      t.belongs_to :song
    end
  end
end
