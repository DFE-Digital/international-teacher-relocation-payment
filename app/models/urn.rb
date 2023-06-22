# frozen_string_literal: true

# Urn represents a Uniform Resource Name (URN) generator.
# It generates a URN with a fixed prefix and a random alphanumeric suffix.
#
# Uses DEC alphabet + 2..9 numbers to decrease ambiguity.
#
# Example:
#
#   Urn.generate('teacher')          # => "IRPTE1A2B3C"
#   Urn.generate('teacher')          # => "IRPTE1A2B3C"
#   Urn.generate('salaried_trainee') # => "IRPLT1A2B3C"
#
#  Duplications
#    Total number of combinations is: 26^6 = 308,915,776 ~ 310M
#
class Urn
  attr_reader :value
  attr_writer :suffix

  def self.generate(applicant_type)
    code = applicant_type_code(applicant_type)
    PREFIX + code + Array.new(LENGTH) { CHARSET.sample }.join
  end

  CHARSET = %w[A B C D E F H J K L M N P R S T U V 2 3 4 5 6 7 8 9].freeze
  PREFIX = "IRP"
  LENGTH = 6
  private_constant :CHARSET, :PREFIX, :LENGTH

  def self.applicant_type_code(applicant_type)
    case applicant_type
    when "teacher"
      "TE"
    when "salaried_trainee"
      "LT"
    else
      raise(ArgumentError, "Invalid applicant type: #{applicant_type}")
    end
  end
end
