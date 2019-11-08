class ProcessRawData

  # @return Boolean true
  def self.call
    ProcessProfile.call
    ProcessRecommendations.call
    ProcessUpdates.call
    true
  end

end
