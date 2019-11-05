class Match < ApplicationRecord
  belongs_to :person
  belongs_to :account

  serialize :photos

  # @param Tinder::Match
  def self.from_match(match)
    Person.where(tinder_id: match._id[24, 48]).first.then do |person|
      find_or_initialize_by(tinder_match_id: match.id).then do |obj|
        obj.assign_attributes(is_following:         match.following,
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
                              person_id:            person.id,
                              participants:         match.participants,
                              readreceipt:          match.readreceipt,
                              seen:                 match.seen)
        obj
      end
    end
  end

  # @param Tinder::Updates
  def self.from_updates(updates)
    updates.matches.map { |m| from_match(m) }
  end

end