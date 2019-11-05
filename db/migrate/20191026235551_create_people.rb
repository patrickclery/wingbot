class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.date :birthdate
      t.integer :distance_mi
      t.string :gender
      t.string :instagram_id
      t.string :instagram_username
      t.string :name
      t.text :bio
      t.string :city

      # Collections
      t.text :common_friends
      t.text :instagram_photos
      t.text :jobs
      t.text :photos
      t.text :schools
      t.text :teaser

      # Keys provided by tinder
      t.string :tinder_id

      # Timestamps
      t.timestamp :active_at
      t.timestamp :created_at
      t.timestamp :deleted_at
      t.timestamp :updated_at

      # Flags
      t.boolean :is_traveling
      t.boolean :hide_age
      t.boolean :hide_distance
    end
  end
end
