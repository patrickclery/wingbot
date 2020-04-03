# frozen_string_literal: true

require 'faker'
require 'faker/default/alphanumeric'

module Faker
  class Tinder
    # @return [String] A random 24-character tinder_id
    # @example
    #   Faker::Tinder.account_id #=> "3yfq2phxtb3yfq2phxtb3yfq"
    def self.id
      Alphanumeric.alphanumeric(number: 24)
    end
  end
end