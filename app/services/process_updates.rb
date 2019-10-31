class ProcessUpdates

  # Fetches the latest updates and handles errors
  # @raise Exception if the request fails
  # @return Boolean true
  class << self

    def call # Fetching updates...
      RawData.where(imported_at: nil, tag: 'updates').all do |rec|
        Match.from_updates(updates: rec.data).save!
      end
      true
    rescue StandardError => e
      fail "Failed to save updates: #{e.message}"
    end

  end
end
