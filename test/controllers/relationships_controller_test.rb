require "test_helper"

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  setup { sign_in_as users(:nixon) }

  test "following someone" do
    get new_relationship_url
    assert_response :success

    assert_difference("Relationship.count") do
       post relationships_url, params: { username: users(:daniel).username }
    end

    assert_redirected_to users(:daniel)
    assert_equal flash[:notice], "User was successfully followed"
  end

  test "following someone that is already followed" do
    assert_no_difference("Relationship.count") do
       post relationships_url, params: { username: "javierfonseca" }
    end

    assert_response :unprocessable_entity
  end

end
