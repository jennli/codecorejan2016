class CampaignDecorator < Draper::Decorator
  delegate_all

  def name
    object.name.titleize
  end

  def goal
    h.number_to_currency object.goal
  end

  def end_date
    h.formatted_date_time object.end_date
  end

  def state_label
    bootstrap_classes = {"published" => "label label-success", "draft" => "label label-default", "funded" => "label label-success", "cancled" => "label label-warning"}
    h.content_tag :div, class:"#{bootstrap_classes[object.aasm_state]}" do
      object.aasm_state
    end
  end


  def publish_button

    # <% if @campaign.draft? %>
    # <%= link_to "Publish", campaign_publishings_path(@campaign), method: :post, class: "btn btn-primary btn-xs", data: {confirm: "are you sure? you won't be able to edit a campaign after it's pubhlished"} %>
    # <% end %>

    if object.draft?
      h.link_to "publish",
      h.campaign_publishings_path(object), method: :post, class: "btn btn-primary btn-xs", data: {confirm: "are you sure? you won't be able to edit a campaign after it's pubhlished"}
    end

  end


  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
