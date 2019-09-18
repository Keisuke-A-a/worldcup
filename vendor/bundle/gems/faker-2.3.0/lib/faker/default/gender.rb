# frozen_string_literal: true

module Faker
  class Gender < Base
    class << self
      ##
      # Produces the name of a gender identity.
      #
      # @return [String]
      #
      # @example
      #   Faker::Gender.type #=> "Non-binary"
      #
      # @faker.version 1.9.0
      def type
        fetch('gender.types')
      end

      ##
      # Produces either 'Male' or 'Female'.
      #
      # @return [String]
      #
      # @example
      #   Faker::Gender.binary_type #=> "Female"
      #
      # @faker.version 1.9.0
      def binary_type
        fetch('gender.binary_types')
      end
    end
  end
end
