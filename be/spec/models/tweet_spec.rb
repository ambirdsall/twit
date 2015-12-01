require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context 'text' do
    it "can't be longer than 140 characters" do
      max_text    = Faker::Lorem.characters(140)
      excess_text = Faker::Lorem.characters(141)

      expect(Tweet.new(text: max_text).valid?).to be(true)
      expect(Tweet.new(text: excess_text).valid?).to be(false)
    end
    it "can't be blank" do
      expect(Tweet.new(text: '').valid?).to be(false)
    end
  end
end
