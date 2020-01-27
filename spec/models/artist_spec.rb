require 'rails_helper'

artist = FactoryGirl.create(:artist)

RSpec.describe Artist, type: :model do
  it "has a valid factory" do
    expect(artist).to be_valid
  end
end