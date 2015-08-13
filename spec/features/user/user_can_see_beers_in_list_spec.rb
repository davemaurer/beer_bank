require 'rails_helper'

RSpec.feature "user" do
    let(:beer1) {create(:beer1)}
    let(:beer2) {create(:beer2)}
  before(:each) {
    stub_omniauth
  }

  xit "sees beers" do
    Beer.create(name: "beer3", rating: 1, ibu: 10, abv: 5, description: "beer1desc")
    Beer.create(name: "beer4", rating: 2, ibu: 20, abv: 6, description: "beer2desc")
    visit "/beers"

    expect(page).to have_content("beer3")
  end
end
