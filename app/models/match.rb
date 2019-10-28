class Match < ApplicationRecord
  belongs_to :person

  serialize :photos

  def self.from_match(match:)
    # Mass assign everything

    new is_following:         match.following,
        is_following_moments: match.following_moments,
        is_boost_match:       match.is_boost_match,
        is_closed:            match.closed,
        is_dead:              match.dead,
        is_fast_match:        match.is_fast_match,
        is_muted:             match.muted,
        is_pending:           match.pending,
        is_super_like:        match.is_super_like,
        last_active_at:       match.last_activity_date,
        matched_at:           match.created_date,
        tinder_match_id:      match._id,
        person_id:            match.id,
        participants:         match.participants,
        readreceipt:          match.readreceipt,
        seen:                 match.seen
  end

end
