require 'tinder/client' # provides `Tinder::Updates`

class RawData < ApplicationRecord

  # @return Tinder::Updates A struct containing Tinder account data
  def to_updates
    Tinder::Updates.new(data)
  end

  # @return Tinder::Recommendations A struct containing Tinder account data
  def to_recommendations
    data.map { |rec| Tinder::Recommendation.new(rec.data) }
  end
end
