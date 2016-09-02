class PledgesController < ApplicationController
  before_action :authenticate_user
  before_action :find_campaign, only:[:destroy]

  def create
    @campaign = Campaign.friendly.find params[:campaign_id]

    @pledge = Pledge.new pledge_params
    @pledge.campaign = @campaign
    @pledge.user = current_user
    @pledge.save
    # render nothing: true
    redirect_to new_pledge_payment_path(@pledge), notice:"thanks for pledging"
  end

  def destroy
    if user_logged_in?
      @pledge = current_user.pledges.find params[:id]
      @pledge.destroy
      redirect_to campaign_path(@campaign)
    else
      redirect_to new_session_path
    end
  end

  private

  def pledge_params
    params.require(:pledge).permit(:amount)
  end

  def find_campaign
    @campaign = Campaign.find params[:campaign_id]
  end
end
