require 'test_helper'

class RingTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Ring.new.valid?
  end
end
