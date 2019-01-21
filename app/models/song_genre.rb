class SongGenre < ActiveRecord::Base
  belong_to :genre
  belong_to :song
end
