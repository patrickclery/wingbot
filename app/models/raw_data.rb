class RawData < ApplicationRecord
  belongs_to :account, autosave: true

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

  # @return Boolean true
  def mark_as_imported!
    self.imported_at = Time.now
    save!
  end
end
