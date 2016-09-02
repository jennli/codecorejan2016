require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do

  let(:user) {FactoryGirl.create(:user)}
  let(:campaign) {FactoryGirl.create(:campaign,{user: user})}
  let(:campaign_1) {FactoryGirl.create(:campaign)}

  # def campaign
  # @campaign ||= FactoryGirl.create(:campaign)
  #

  describe "#new" do
    it "renders the new template" do
      # This mimics sending a get request to the new action
      get :new
      # response is an object that is given to us by RSpec that will help test
      # things like redirect / render
      # render_template is a an RSpec (rspec-rails) matcher that help us check
      # if the controller renders the template with the given name.
      expect(response).to render_template(:new)
    end

    it "instantiates a new Campaign object and sets it to @campaign" do
      get :new
      expect(assigns(:campaign)).to be_a_new(Campaign)
    end
  end

  describe "#create" do
    before { signin(user) }
    context "with valid attributes" do
      def valid_request
        post :create, campaign: {name: "some valid name",
          description: "some valid description",
          goal: 1000000
        }
      end
      it "creates a record in the database" do
        campaign_count_before = Campaign.count
        valid_request
        campaign_count_after = Campaign.count
        expect(campaign_count_after - campaign_count_before).to eq(1)
      end

      it "redirects to the campaign show page" do
        valid_request
        expect(response).to redirect_to(campaign_path(Campaign.last))
      end

      it "sets a flash notice message" do
        valid_request
        expect(flash[:notice]).to be
      end

    end
    context "with invalid attributes" do

      def invalid_request
        post :create, campaign: {name: nil, description: "some valid description",
          goal: 1000000
        }
      end

      it "doesn't create a record in the database" do
        campaign_count_before = Campaign.count
        invalid_request
        campaign_count_after = Campaign.count
        expect(campaign_count_after).to eq(campaign_count_before)
      end

      it "renders the new template" do
        invalid_request
        expect(response).to render_template :new
      end

      it "sets a flash alert message" do
        invalid_request
        expect(flash[:alert]).to be
      end
    end
  end

  describe "#show" do
    before do
      #GIVEN:assuming starting from clean, create a campaign object
      campaign
      # when
      get :show, id: campaign.id
    end

    it "finds the object by its id and sets to @campaign variable" do
      # then
      expect(assigns(:campaign)).to eq(campaign)
    end

    it "renders the show template" do
      # then
      expect(response).to render_template(:show)
    end

    it "raises an error if the id passed doesn't match a record in the DB" do
      expect{get :show, id: 232323232324}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "#index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "fetches records from the database and assign to @campaigns" do
      get :index
      expect(assigns(:campaigns)).to eq([campaign,campaign_1])
    end
  end

  describe "#edit" do
    before do
      get :edit, id: campaign
    end

    it "renders the edit template" do
      expect(response).to render_template(:edit)
    end

    it "finds the campaign by id and sets it to the @campaign instance variable" do
      expect(assigns(:campaign)).to eq(campaign)
    end
  end

  describe "#update" do
    context "with valid attributes" do
      before do
        # Given: use the campaign method we defined with let
        patch :update, id: campaign.id, campaign: {name: "new valid name"}
      end

      it "updates the record with new parameters" do
        expect(campaign.reload.name).to eq("new valid name")
      end

      it "redirects to the campaign page" do
        expect(response).to redirect_to(campaign_path(campaign.reload))
      end

      it "sets a flash message" do
        expect(flash[:notice]).to be
      end
    end

    context "with invalid attributes" do
      before do
        @goal_before = campaign.goal
        patch :update, id: campaign.id, campaign: {goal: 1}
      end

      it "doesn't update the record" do
        #given can use 'let'
        # then
        expect(campaign.reload.goal).to eq(@goal_before)
      end
      it "renders the edit page" do
        expect(response).to render_template :edit
      end

      it "sets an alert message" do
        expect(flash[:alert]).to be
      end
    end
  end

  describe "#destroy" do
    context "with user signed in user" do
      before { signin(user) }
      context "with user owns the campaign" do
        # let!(:campaign) { FactoryGirl.create(:campaign) }
        it "removes the campaign from the database" do
          # campaign
          # expect { delete :destroy, id: campaign.id }.to change { Campaign.count }.by(-1)
          campaign
          count_before = Campaign.count
          delete :destroy, id:campaign.id
          expect(count_before - Campaign.count).to eq(1)
        end

        it "redirects to the campaign index page" do
          delete :destroy, id:campaign.id
          expect(response).to redirect_to(campaigns_path)
        end

        it "displays a notice" do
          delete :destroy, id:campaign.id
          expect(flash[:notice]).to be
        end
      end
      it "raises an error if current user does not own the campaign" do
        expect do
          delete :destroy, id:campaign_1.id
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context "with no signed in user" do
      it "redirects to the sign in page" do
        delete :destroy, id:campaign.id
        expect(response).to redirect_to new_session_path
      end
    end
  end
end
