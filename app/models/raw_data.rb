require 'tinder/client' # provides `Tinder::Updates`

class RawData < ApplicationRecord
  # @return Tinder::Updates A struct containing Tinder account data
  def to_update
    Tinder::Updates.new(data)
  end
end
