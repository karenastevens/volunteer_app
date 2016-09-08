require 'test_helper'

class ListingsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @listing = listings(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Listing.count' do 
      post listings_path, params: { listing: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do 
    assert_no_difference 'Listing.count' do 
      delete listing_path(@listing)
    end
    assert_redirected_to login_url
  end
end
