class StaticPagesController < ApplicationController
 
  def home
    @listing = current_user.listings.build if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
