class CreateAllTables < ActiveRecord::Migration
  def change

    create_table :artists do |el|
      el.string :name
    end

    create_table :genres do |el|
      el.string :name
    end

    create_table :songs do |el|
      el.belongs_to :artist ,index: true
      el.string :name
    end

    create_table :song_genres do |el|
      el.belongs_to :song, index: true
      el.belongs_to :genre, index: true
    end

  end 
end
