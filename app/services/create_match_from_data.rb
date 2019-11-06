class CreateMatchFromData

  # @return Account
  # @param Hash JSON response of from a profile request
  def self.call(match:, person:, account:)
    obj = Match.new account:              account,
                    is_following:         match.following,
                    is_boost_match:       match.is_boost_match,
                    is_closed:            match.closed,
                    is_dead:              match.dead,
                    is_fast_match:        match.is_fast_match,
                    is_following_moments: match.following_moments,
                    is_muted:             match.muted,
                    is_pending:           match.pending,
                    is_super_like:        match.is_super_like,
                    last_active_at:       match.last_activity_date,
                    matched_at:           match.created_date,
                    participants:         match.participants,
                    person:               person,
                    readreceipt:          match.readreceipt,
                    seen:                 match.seen,
                    tinder_match_id:      match._id
    obj.save!
    obj
  end
end