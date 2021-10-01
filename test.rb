# frozen_string_literal: true

require 'minitest/autorun'
require './main'
# test to check if correcter function
class CorrecterTest < Minitest::Test
  def setup
    @rand = Random.new
  end

  def test_empty
    assert_equal '', convert('')
  end

  def test_one_word
    assert_equal 'word', convert('word')
  end

  def test_two_words
    assert_equal 'word drow_rehtona', convert('word another_word')
  end

  def test_generated
    30.times do
      words = (0...@rand.rand(4..15)).map { _random_word }
      input = words.join ' '
      expected_output = words.map.with_index do |value, index|
        index.even? ? value : value.reverse
      end.join ' '
      assert_equal expected_output, convert(input)
    end
  end

  def _random_word
    alphabet = ('a'..'z').to_a
    (0...@rand.rand(5..10)).map { alphabet[rand(26)] }
                            .join('')
  end
end

