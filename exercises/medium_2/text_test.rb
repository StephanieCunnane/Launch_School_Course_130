require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @sample_text = Text.new(SAMPLE_TEXT)
  end

  def test_swap
    assert_equal(SAMPLE_TEXT.tr('a', 'e'), @sample_text.swap('a', 'e'))
  end

  def teardown
  end
end
