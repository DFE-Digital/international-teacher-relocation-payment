# frozen_string_literal: true

# Urn represents a Uniform Resource Name (URN) generator.
# It generates a URN with a fixed prefix and a random alphanumeric suffix.
#
# Uses DEC alphabet + 2..9 numbers to decrease ambiguity.
#
# Example:
#
#   Urn.new.value # => "IRP1A2B3C"
#
# As it implements `.dump` and `.load`, it can be used with `serialize` as
# an Active Model. It can be included as an attribute in your model
# and automatically handle serialization/deserialization.
#
# Example with ActiveRecord:
#   app/models/your_model.rb
#
#   class YourModel < ActiveRecord::Base
#     serialize :urn, Urn
#   end
#
#   your_model = YourModel.new
#   your_model.urn = Urn.new
#   your_model.save
#   your_model.reload
#   puts your_model.urn.value
#
#   Urn.dump(Urn.new) # => "IRPGA2B3C"
#   Urn.load("IRPGA2B3C") # => #<Urn:0x00000001154a9a78 @value="IRPGA2B3C">
#
#  Duplications
#    Total number of combinations is: 26^6 = 308,915,776 ~ 310M
class Urn
  attr_reader :value

  def initialize(value = nil)
    @value = value || Urn.generate_urn
  end

  def self.dump(urn)
    urn.value
  end

  def self.load(value)
    Urn.new(value)
  end

  def ==(other)
    return false unless other.is_a?(Urn)

    @value == other.value
  end

  CHARSET = %w[A B C D E F H J K L M N P R S T U V 2 3 4 5 6 7 8 9].freeze
  PREFIX = "IRP"
  LENGTH = 6
  private_constant :CHARSET, :PREFIX, :LENGTH

  def self.generate_urn
    "#{PREFIX} " + Array.new(LENGTH) { CHARSET.sample }.join
  end

  private_methods :generate_urn
end
