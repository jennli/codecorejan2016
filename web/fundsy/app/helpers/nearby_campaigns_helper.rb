module NearbyCampaignsHelper
  def markers(campaigns)
    Gmaps4rails.build_markers(@users) do |campaign, marker|
      marker.lat campaign.latitude
      marker.lng campaign.longitude
      marker.infowindow campaign.title
    end
  end
end
