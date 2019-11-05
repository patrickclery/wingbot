require 'tinder/client' # provides `Tinder::Updates`

class RawData < ApplicationRecord

  # @return Tinder::Updates
  def to_updates
    Tinder::Updates.new(data)
  end

  # @return Tinder::Recommendations
  def to_recommendations
    data.map { |rec| Tinder::Recommendation.new(rec) }
  end

  # @return Tinder::ActiveProfile
  def to_profile
    Tinder::ActiveProfile.new(data)
  end

  def mark_as_imported!
    self.imported_at = Time.now
    save
    true
  end
end
