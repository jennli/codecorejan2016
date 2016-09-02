class SearchlistingsController < ApplicationController

  def index
    if params[:destination]
      destination = params[:destination]
      @apartment_listings = apartment_listings.all.where("city ilike ?", destination)

      respond_to do |format|
        format.html {render "apartment_listings/index"}
        format.js {render :search_result}
      end
    end
  end

end
