require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let (:user){ FactoryGirl.create(:user)}

  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    context "with valid credentials" do
      def create_user_and_valid_login
        post :create, {email: user.email, password: user.password}
      end
      it "sets the session user_id to the user with the passed email" do
        create_user_and_valid_login
        expect(session[:user_id]).to eq(user.id)
      end

      it "rediect to the root path" do
        create_user_and_valid_login
        expect(response).to redirect_to(root_path)
      end

      it "sets a flash notice message" do
        create_user_and_valid_login
        expect(flash[:notice]).to be
      end
    end

    context "with invalid credentials" do
      def create_user_and_invalid_login
        @u = FactoryGirl.create(:user, {password: "123456"})
        post :create, {email: @u.email, password: "000000"}
      end
      it "does not set the session user_id to the user with the passed email" do
        create_user_and_invalid_login
        expect(session[:user_id]).not_to be
      end

      it "renders the new template" do
        create_user_and_invalid_login
        expect(response).to render_template(:new)
      end

      it "sets a flash alert message" do
        create_user_and_invalid_login
        expect(flash[:alert]).to be
      end
    end
  end

  describe "#destroy" do
    before do
      user
      request.session[:user_id] = user.id
      delete :destroy
    end

    it "sets the session user_id to nil" do
      expect(session[:user_id]).not_to be
    end

    it "sets a flash notice" do
      expect(flash[:notice]).to be
    end

    it "redirects to the root path" do
      expect(response).to redirect_to(root_path)
    end
  end
end
