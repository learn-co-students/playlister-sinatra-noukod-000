class CreateArtists < ActiveRecord::Migration[5.1]
  def up 
    create_table :artists do |a|
      a.string :name 
    end
  end
end
