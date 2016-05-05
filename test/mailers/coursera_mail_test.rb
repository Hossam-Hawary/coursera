require 'test_helper'

class CourseraMailTest < ActionMailer::TestCase
  test "newRegistration" do
    mail = CourseraMail.newRegistration
    assert_equal "Newregistration", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
