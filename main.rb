# frozen_string_literal: true

# class containing some string correction utils
class CorrectionUtil
  def self.convert(string)
    string.is_a?(String) || (return ArgumentError)
    string.gsub(/\w+/).with_index { |value, index| index.even? ? value : value.reverse }
  end
end
