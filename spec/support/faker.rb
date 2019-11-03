require 'faker'
require 'faker/default/alphanumeric'
# frozen_string_literal: true

module Faker
  class Tinder
    # @return [String] A random 24-character tinder_id
    # @example
    #   Faker::Tinder.account_id #=> "3yfq2phxtb3yfq2phxtb3yfq"
    def self.id
      Alphanumeric.alpha(number: 24)
    end
  end
end