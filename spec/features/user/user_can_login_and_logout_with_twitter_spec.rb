require 'rails_helper'

RSpec.feature "user" do
  before(:each) {
    stub_omniauth
  }

  it "can log in" do
    visit "/"

    expect(page.status_code).to eq(200)

    click_on("Login with Twitter")

    expect(current_path).to eq("/beers")
    expect(page).to have_content("Dave")
  end

  it "can log out" do
    visit "/"

    click_on("Login with Twitter")

    expect(current_path).to eq("/beers")

    within(".name") do
      click_link("Logout")
    end

    expect(current_path).to eq("/")
  end
end
