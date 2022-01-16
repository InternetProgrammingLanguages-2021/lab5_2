# frozen_string_literal: true

require 'minitest/autorun'
require './main'
# test to check if correcter function
class CorrecterTest < Minitest::Test
  def setup
    @rand = Random.new
  end

  def test_empty
    assert_equal '', CorrectionUtil.convert('')
  end

  def test_one_word
    assert_equal 'word', CorrectionUtil.convert('word')
  end

  def test_two_words
    assert_equal 'word drow_rehtona', CorrectionUtil.convert('word another_word')
  end

  def test_generated
    30.times do
      words = (0..._rand.rand(4..15)).map { _random_word }
      input = words.join ' '
      assert_equal CorrecterTest._expected_output(words), CorrectionUtil.convert(input)
    end
  end

  def self._expected_output(words)
    words.map.with_index do |value, index|
      index.even? ? value : value.reverse
    end.join ' '
  end

  def _rand
    @rand ||= Random.new
  end

  def _random_word
    alphabet = ('a'..'z').to_a
    (0..._rand.rand(5..10)).map { alphabet[_rand.rand(26)] }
                           .join('')
  end
end
