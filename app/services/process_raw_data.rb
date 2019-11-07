require 'tinder/client'

class ProcessRawData

  # @raise Exception
  # @return Boolean true
  class << self

    def call
      ProcessProfile.call
      ProcessRecommendations.call
      ProcessUpdates.call
      true
    end

  end
end
