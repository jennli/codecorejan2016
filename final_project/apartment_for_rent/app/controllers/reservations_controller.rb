class ReservationsController < ApplicationController
  before_action :authenticate_user
  before_action :find_apartment

  def create
    @reservation = @apartment_listing.reservations.new reservation_param
    @reservation.user = current_user
    if @reservation.save
      redirect_to @reservation, notice: "you have successfully reserved this room!"
    else
      redirect_to @apartment_listing, alert:"#{@reservation.errors.full_messages.join(',')}"
    end
  end

  private

  def reservation_param
    params.require(:reservation).permit(:checkin_date, :checkout_date)
  end

  def find_apartment
    @apartment_listing = ApartmentListing.find params[:apartment_listing_id]
  end

end
