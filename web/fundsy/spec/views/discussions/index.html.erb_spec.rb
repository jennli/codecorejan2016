require 'rails_helper'

RSpec.describe "discussions/index", type: :view do
  before(:each) do
    assign(:discussions, [
      Discussion.create!(
        :body => "Body"
      ),
      Discussion.create!(
        :body => "Body"
      )
    ])
  end

  it "renders a list of discussions" do
    render
    assert_select "tr>td", :text => "Body".to_s, :count => 2
  end
end
