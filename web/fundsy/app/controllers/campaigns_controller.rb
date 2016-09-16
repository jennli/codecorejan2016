class CampaignsController < ApplicationController
  before_action :find_campaign, only: [ :edit, :update, :show]
  REWARD_COUNT = 0

  def new
    @campaign = Campaign.new
    build_associated_rewards
  end

  def create
    @campaign = Campaign.new
    service = Campaigns::CreateCampaign.new(user: current_user, params: campaign_params)

    if service.call
      campaign = service.campaign
      flash[:notice] = "campaign created"
      redirect_to campaign_path(campaign)
    else
      build_associated_rewards
      flash[:alert] = "campaign did not get created"
      render :new
    end
  end

  def show
    # find by id is going to return nil instead of throwing an error is id not found
    # @campaign = Campaign.find_by_id params[:id]
    # render :show
    @comment = Comment.new
    @pledge = Pledge.new
  end

  def index
    # @campaigns = Campaign.all
    @campaigns = Campaign.order("created_at ASC").published
  end

  def edit
    build_associated_rewards
  end

  def update
    # we need to force the slug to be nil before updating it in order to have
    # FriendlyId generate a new slug for us. We're using `history` option with
    # FriendlyId so old urls will still work.
    @campaign.slug = nil

    if @campaign.update(campaign_params)
      redirect_to campaign_path(@campaign), notice: "updated successfully"
    else
      flash[:alert] = "update was unsucessful"
      render :edit
    end
  end

  def destroy
    if user_logged_in?
      @campaign = current_user.campaigns.find params[:id]
      @campaign.destroy
      flash[:notice] = "destroyed"
      redirect_to campaigns_path
    else
      redirect_to new_session_path
    end
  end

  private
  def find_campaign
    @campaign = Campaign.friendly.find(params[:id]).decorate
  end

  def campaign_params
    params.require(:campaign).permit(:name, :goal, :description, :end_date, :address,
    :image, {rewards_attributes: [:amount, :title, :id, :_destroy]})
  end

  def build_associated_rewards
    number_to_build = REWARD_COUNT - @campaign.rewards.size
    number_to_build.times {@campaign.rewards.build}

  end

end
