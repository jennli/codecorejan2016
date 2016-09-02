require 'rails_helper'

RSpec.describe Campaign, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "validations" do
    # it is a method that
    # takes a test example description and
    # a block of code where you can construct your test
    # every test scenario must be put with in an 'it' or 'specify' block
    it "doesn't allow creating a compain with no name" do

      # Given: campaign with no title
      c = Campaign.new
      # When: we validate the campaign
      campaign_valid = c.valid?
      #Then: expect that campaign_valid = false
      expect(campaign_valid).to eq(false)
    end

    it "requires a goal" do
      #GIVEN: campaign with no goal
      c = Campaign.new
      # When
      c.valid?
      # Then
      expect(c.errors).to have_key(:goal)
      # we call methods like: have_key matchers
      # RSpec rails comes with many built-in matchers
    end

    it "requires a goal that is more than 10 dollars" do
      c = Campaign.new name: "test1", goal: 9
      c.valid?
      expect(c.errors).to have_key(:goal)
    end

    it "requires a unique title" do
      # GIVEN:
        c1 = Campaign.create name: "camp1", goal: 100
        c2 = Campaign.new name: "camp1", goal: 50

      #When
        c2.valid?
      #Then
        expect(c2.errors).to have_key(:name)

    end

  end
end
