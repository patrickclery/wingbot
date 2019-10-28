class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.date :birthdate
      t.integer :distance_mi
      t.string :bio
      t.string :gender
      t.string :instagram_id
      t.string :instagram_username
      t.string :name

      # Collections
      t.string :common_friends
      t.string :instagram_photos
      t.string :jobs
      t.string :photos
      t.string :schools
      t.string :teaser

      # Keys provided by tinder
      t.string :match_id
      t.string :tinder_id

      # Timestamps
      t.timestamp :active_at
      t.timestamp :created_at
      t.timestamp :deleted_at
      t.timestamp :muted_at
      t.timestamp :updated_at

      # Flags
      t.boolean :is_traveling
      t.boolean :hide_age
      t.boolean :hide_distance
    end
  end
end
