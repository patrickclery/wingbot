class ProcessUpdates

  # Fetches the latest updates and handles errors
  # @raise Exception if the request fails
  # @return Boolean true
  # @param String the ID of your Tinder account, needed for
  def self.call
    RawData.where(imported_at: nil, tag: 'updates').each do |rec|
      rec.to_updates.then do |updates|
        # All the people should already exist, ProcessProfile & Recommendations should have been called
        updates.matches.each do |match|
          tinder_match_id   = match._id
          tinder_person_id  = tinder_match_id[0, 24]
          tinder_account_id = tinder_match_id[24, 48]
          person            = Person.find_or_initialize_by(tinder_id: tinder_person_id)
          account           = Account.find_or_initialize_by(tinder_id: tinder_account_id)

          new_match = Match.find_or_initialize_by tinder_match_id: tinder_match_id
          new_match.assign_attributes account:              account,
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
                                      tinder_match_id:      tinder_match_id
          new_match.save!

          # Process messages
          match.messages.each do |message|
            Message.create content:           message.message,
                           created_at:        message.created_date,
                           match:             new_match,
                           sent_at:           message.sent_date,
                           tinder_message_id: message._id
          end
        end

        rec.mark_as_imported!
      end
    end
    true

  end
end