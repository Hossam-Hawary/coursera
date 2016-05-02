require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "valid user" do
    assert (User.all.size==1) #inserted in fixtures
    assert User.first.name="MyName"
  end

  test "invalid user same email exist" do
    inv_user=User.new
    inv_user.email= "hossam6@gmail.com"
    inv_user.name= "Hossam"
    inv_user.gender ="male"

    assert inv_user.invalid?
    assert inv_user.errors['email'].any?
  end

end

