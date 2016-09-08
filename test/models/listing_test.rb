require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:michael)
    @listing = @user.listings.build(content: "Lorem ipsum")
  end

  test "should be valid" do 
    assert @listing.valid?
  end

  test "user id should be present" do 
    @listing.user_id = nil 
    assert_not @listing.valid?
  end

  test "content should be present" do 
    @listing.content = "   "
    assert_not @listing.valid?
  end

  test "order should be most recent first" do 
    assert_equal listings(:most_recent), Listing.first
  end
end
