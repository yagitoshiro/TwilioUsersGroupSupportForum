require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "activate" do
    mail = UserMailer.activate
    assert_equal "Activate", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "activated" do
    mail = UserMailer.activated
    assert_equal "Activated", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
