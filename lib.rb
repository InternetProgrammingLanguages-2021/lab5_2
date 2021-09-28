# frozen_string_literal: true

def convert(string)
  string.is_a?(String) || (return ArgumentError)
  string.gsub(/\w+/).with_index { |value, index| index.even? ? value : value.reverse }
end
