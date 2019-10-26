require 'tinder/client' # provides `Tinder::Updates`

class RawData < ApplicationRecord

  # @return Tinder::Updates A struct containing Tinder account data
  def to_update
    Tinder::Updates.new(JSON.parse(data))
  end

  # @return Tinder::Recommendations A struct containing Tinder account data
  def to_recommendation
    Tinder::Recommendation.new(JSON.parse(data))
  end
end
