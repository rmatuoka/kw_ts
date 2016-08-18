require 'test_helper'

class EnterprisesTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Enterprises.new.valid?
  end
end
