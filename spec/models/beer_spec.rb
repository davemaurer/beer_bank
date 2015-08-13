require 'rails_helper'

RSpec.describe Beer, type: :model do
  let(:beer) { create(:beer1) }

  it "has attributes" do
    Beer.create(name: "beer", abv: 5, ibu: 6, description: "good")
    expect(Beer.first.name).to eq("beer")
    expect(Beer.first.abv).to eq(5)
    expect(Beer.first.ibu).to eq(6)
    expect(Beer.first.description).to eq("good")
  end
end
