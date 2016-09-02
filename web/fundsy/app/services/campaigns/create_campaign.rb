class Campaigns::CreateCampaign
  include Virtus.model

  attribute :params, Hash
  attribute :user, User
  # this is the campaign that gets created, we may need it for things such as rebuilding teh form with errors
  attribute :campaign, Campaign


  def call
    self.campaign = Campaign.new(params)
    campaign.user = user
    campaign.save
  end

end
