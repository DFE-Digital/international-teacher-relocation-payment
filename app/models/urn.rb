# frozen_string_literal: true

# Urn represents a Uniform Resource Name (URN) generator.
# It generates a URN with a fixed prefix and a random alphanumeric suffix.
#
# Uses DEC alphabet + 2..9 numbers to decrease ambiguity.
#
# Example:
#
#   Urn.generate('teacher')          # => "IRP12345TE"
#   Urn.generate('teacher')          # => "IRP12345TE"
#   Urn.generate('salaried_trainee') # => "IRPLT12345"
#
class Urn
  attr_reader :value
  attr_writer :suffix

  def self.generate(applicant_type)
    code = applicant_type_code(applicant_type)
    PREFIX + Array.new(LENGTH) { CHARSET.sample }.join + code
  end

  CHARSET = %w[0 1 2 3 4 5 6 7 8 9].freeze
  PREFIX = "IRP"
  LENGTH = 5
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
  private_methods :applicant_type_code
end
