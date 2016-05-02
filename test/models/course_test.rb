require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "invalid course no user_id" do
    assert Course.all.size==1
end
end
