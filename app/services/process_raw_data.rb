class ProcessRawData

  # @raise Exception
  # @return Boolean true
  class << self

    def call
      ProcessUpdates.call
      true
    rescue StandardError => e
      fail "Failed: #{e.message}"
    end

  end
end
