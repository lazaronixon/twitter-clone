require "test_helper"
require "support/test_system_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include TestSystemHelper

  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end
