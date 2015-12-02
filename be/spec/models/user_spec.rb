require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it "validates email uniqueness" do
      FactoryGirl.create(:user, email: "test@example.com")
      not_unique = FactoryGirl.build(:user, email: "test@example.com")

      expect(not_unique.valid?).to eq false
    end
  end
end
