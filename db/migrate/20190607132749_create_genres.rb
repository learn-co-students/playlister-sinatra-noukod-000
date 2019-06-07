class CreateGenres < ActiveRecord::Migration[5.1]
  def up 
    create_table :genres do |g|
      g.string :name 
    end
  end
end
