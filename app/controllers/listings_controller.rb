class ListingsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      flash[:success] = "Listing created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def index
    @listings = Listing.paginate(page: params[:page])
  end

  def destroy
  end

  private

    def listing_params
      params.require(:listing).permit(:content)
    end
end
