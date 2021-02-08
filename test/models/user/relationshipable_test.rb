require "test_helper"

class User::RelationshipableTest < ActiveSupport::TestCase
  setup { Current.user = users(:nixon) }

  test "should be following me" do
    assert users(:javier).following?
  end

  test "should not be following me" do
    assert_not users(:alvaro).following?
  end

  test "should be followed by me" do
    assert users(:javier).followed?
  end

  test "should not be followed by me" do
    assert_not users(:daniel).followed?
  end

  test "following someone" do
    assert_difference('Relationship.count') do
      users(:daniel).follow
    end
  end

  test "following someone already following" do
    assert_raises ActiveRecord::RecordInvalid do
      users(:javier).follow
    end
  end

  test "following myself" do
    assert_raises ActiveRecord::RecordInvalid do
      users(:nixon).follow
    end
  end  
end
