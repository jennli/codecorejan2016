require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "requres a first name" do
      # given: a new user
      u = User.new
      # when: use validation
      u.valid?
      # then
      expect(u.errors).to have_key(:first_name)
    end

    it "requires an email" do
      u = User.new
      u.valid?
      expect(u.errors).to have_key(:email)
    end

    it "requires a password" do
      u = User.new
      u.valid?
      expect(u.errors).to have_key(:password)
    end

    it "requires a unique email" do
      # before
      u1 = FactoryGirl.create(:user)
      valid_email = u1.email
      # when
      u = User.new(email: valid_email)
      u.valid?
      # then
      expect(u.errors).to have_key(:email)
    end

  end

  describe ".full_name" do
    it "concatenates the first name and last name" do
      u = FactoryGirl.build(:user)
      expect(u.full_name).to eq("#{u.first_name} #{u.last_name}".titleize)
    end

    it "returns the first name if the last name is missing" do
      u = FactoryGirl.build(:user, {last_name: nil})
      expect(u.full_name).to eq(u.first_name.titleize)
    end
  end

  describe "password generating" do
    it "generates a password_digest on creation" do
      u = FactoryGirl.build(:user)
      expect(u.password_digest).to be
    end
  end
end
