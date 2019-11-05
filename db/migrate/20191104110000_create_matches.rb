class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.belongs_to :people

      t.boolean :is_boost_match
      t.boolean :is_closed
      t.boolean :is_dead
      t.boolean :is_fast_match
      t.boolean :is_following
      t.boolean :is_following_moments
      t.boolean :is_muted
      t.boolean :is_pending
      t.boolean :is_super_like
      t.datetime :last_active_at
      t.datetime :matched_at
      t.integer :common_friend_count
      t.integer :common_like_count
      t.integer :participants, array: true
      t.integer :readreceipt, array: true
      t.integer :seen, array: true
      t.string :tinder_match_id, null: false

      # Timestamps
      t.timestamp :active_at
      t.timestamp :created_at
      t.timestamp :deleted_at
      t.timestamp :updated_at
      t.timestamp :unmatched_at
    end
    add_reference :matches, :person, foreign_key: true
    add_reference :matches, :account, foreign_key: true
  end
end
