class Match < ApplicationRecord
  belongs_to :person, required: true, autosave: true
  has_one :account, through: :person

  # @return ApplicationRecord::Match
  # @param Tinder::Match
  def self.from_match(match_struct)

    tinder_match_id = match_struct._id
    find_or_initialize_by(tinder_match_id: tinder_match_id).then do |match|
      Person.from_person(match_struct.person).then do |person|

        # Find the account, if it's new
        person.account ||= begin
          tinder_account_id = tinder_match_id[24, 48]
          Account.find_or_initialize_by(tinder_id: tinder_account_id)
        end

        match.assign_attributes is_boost_match:       match_struct.is_boost_match,
                                is_closed:            match_struct.closed,
                                is_dead:              match_struct.dead,
                                is_fast_match:        match_struct.is_fast_match,
                                is_following:         match_struct.following,
                                is_following_moments: match_struct.following_moments,
                                is_muted:             match_struct.muted,
                                is_pending:           match_struct.pending,
                                is_super_like:        match_struct.is_super_like,
                                last_active_at:       match_struct.last_activity_date,
                                matched_at:           match_struct.created_date,
                                participants:         match_struct.participants,
                                person:               person,
                                readreceipt:          match_struct.readreceipt,
                                seen:                 match_struct.seen
      end
      match
    end
  end

  # @param Tinder::Updates
  def self.from_updates(updates)
    updates.matches.map { |m| from_match(m) }
  end

end