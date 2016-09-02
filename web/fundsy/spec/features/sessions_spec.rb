require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  context "with valid credentials" do
    it "redirects to the home page / show the user full name / displays text 'Signed In'" do

      visit new_session_path
      user = FactoryGirl.create(:user)

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      click_button "Log In"

      expect(current_path).to eq(root_path)
      expect(page).to have_text(/#{user.full_name}/i)
      expect(page).to have_text(/Signed In/i)
    end
  end
  context "with invalid credentials" do
    it "doens't show the user full name and it displays `Wrong Credentials" do
      user = FactoryGirl.create(:user)
      visit new_session_path

      fill_in "Email", with: "akdjfksa"
      fill_in "password", with: ""
      click_button "Log In"

      expect(page).not_to have_text(/#{user.full_name}/i)
      expect(page).to have_text(/Wrong Credentials/i)
    end

  end
end
