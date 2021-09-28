# frozen_string_literal: true

def convert(string)
  string.is_a?(String) || (return ArgumentError)
  string.split(' ').map
        .with_index { |value, index| index.even? ? value : value.reverse }
        .join ' '
end
