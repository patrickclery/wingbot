class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.belongs_to :people

      t.boolean :is_closed
      t.boolean :is_dead
      t.boolean :is_following
      t.boolean :is_following_moments
      t.boolean :is_boost_match
      t.boolean :is_fast_match
      t.boolean :is_super_like
      t.boolean :is_muted
      t.boolean :is_pending

      t.integer :common_friend_count
      t.integer :common_like_count

      t.string :last_active_at
      t.string :matched_at
      t.string :participants
      t.string :readreceipt
      t.string :seen
      t.string :tinder_match_id # This is the ID used by tinder

      t.timestamps
    end
    add_reference :matches, :person, foreign_key: true
  end
end
