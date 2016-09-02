class ApartmentListingsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  before_action :find_listing, except: [:index, :new, :create]

  def index
    @apartment_listings = ApartmentListing.all
  end

  def show
    @reservation = Reservation.new
  end

  def new
    @apartment_listing = ApartmentListing.new
  end

  def create
    @apartment_listing = ApartmentListing.new apartment_params
    @apartment_listing.user = current_user
    if @apartment_listing.save
      redirect_to @apartment_listing, notice:"listing created successfully"
    else
      flash[:alert] = "listing failed"
      render :new
    end
  end

  def edit
  end

  def update
    if @apartment_listing.update apartment_params
      redirect_to @apartment_listing, notice:"listing updated!"
    else
      flash[:alert] = "failed, please see error below"
      render :edit
    end
  end

  private

  def apartment_params
    params.require(:apartment_listing).permit(:title, :pic_1, :description, :daily_price, :monthly_price, :address, :city)
  end


  def find_listing
    @apartment_listing = ApartmentListing.find params[:id]
  end

end
