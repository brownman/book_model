require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "can add users" do
u1 = User.create!
assert_equal u1 , nil
end
end
