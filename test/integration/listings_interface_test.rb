require 'test_helper'

class ListingsInterfaceTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end

  test "listing interface" do 
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Listing.count' do 
      post listings_path, params: { listing: { content: "" } }
    end 
    assert_select 'div#error_explanation'
    # Valid submission
    title = "Hello"
    content = "This listing really ties the room together"
    assert_difference 'Listing.count', 1 do 
      post listings_path, params: { listing: { title: title, content: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # Delete post
    assert_select 'a', text: 'delete'
    first_listing = @user.listings.paginate(page: 1).first
    assert_difference "Listing.count", -1 do 
      delete listing_path(first_listing)
    end
    # Visit different user (no delete links)
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end
end
