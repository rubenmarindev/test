require 'rails_helper'

RSpec.describe Artist, type: :model do
  it "has a valid factory" do
    expect(artist).to be_valid
  end
end