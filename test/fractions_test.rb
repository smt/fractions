require File.dirname(__FILE__) + '/../../../../test/test_helper'

class FractionsTest < Test::Unit::TestCase
  include Sunblush::Fractions
  
  def setup
    @decimal = 0.5625
  end
  
  def test_should_be_original_string_length
    assert_equal(6, @decimal.to_s.length)
  end
  
  def test_should_be_number_decimal_places
    assert_equal(4, @decimal.number_decimal_places)
  end
  
  def test_should_be_array
    assert_kind_of(Array, @decimal.to_fraction)
  end
  
  def test_should_be_correct_array_length
    assert_equal(2, @decimal.to_fraction.count)
  end
  
  def test_should_be_correct_top_value
    assert_equal(9, @decimal.to_fraction.first)
  end
  
  def test_should_be_correct_bottom_value
    assert_equal(16, @decimal.to_fraction.last)
  end
  
  def test_should_be_correct_values
    assert_equal([9,16], @decimal.to_fraction)
  end
  
  def test_should_be_positive_top_value_for_negative_decimal
    @decimal = -0.5625
    assert_equal(9, @decimal.to_fraction.first)
  end
  
  def test_should_be_negative_bottom_value_for_negative_decimal
    @decimal = -0.5625
    assert_equal(-16, @decimal.to_fraction.last)
  end
  
  def test_should_be_correct_values_for_negative_decimal
    @decimal = -0.5625
    assert_equal([9,-16], @decimal.to_fraction)
  end
  
  def test_should_be_correct_top_value_for_inverted_decimal
    @decimal = 9 / 0.5625
    assert_equal(16, @decimal.to_fraction.first)
  end
  
  def test_should_be_correct_bottom_value_for_inverted_decimal
    @decimal = 9 / 0.5625
    assert_equal(1, @decimal.to_fraction.last)
  end
  
  def test_should_be_correct_values_for_inverted_decimal
    @decimal = 9 / 0.5625
    assert_equal([16,1], @decimal.to_fraction)
  end
end