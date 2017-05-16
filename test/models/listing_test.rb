require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:michael)
    @listing = @user.listings.build(title: "Lorem ipsum", content: "Lorem ipsum")
  end

  test "should be valid" do 
    assert @listing.valid?
  end

  test "user id should be present" do 
    @listing.user_id = nil 
    assert_not @listing.valid?
  end

  #test "title should be present" do 
    #@listing.title = nil
    #assert_not @listing.valid?
  #end

  test "title should be at most 140 characters" do
    @listing.title = "a" * 141
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
