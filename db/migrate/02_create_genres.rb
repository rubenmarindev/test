class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name
      t.string :artist_id
      t.belongs_to:artist
      
      t.timestamps
    end
  end
end


