require "test_helper"

class ServerbTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Serverb::VERSION
  end
end
