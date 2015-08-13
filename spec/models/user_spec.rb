require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it "has a name" do
    create :user
    expect(User.first.name).to eq("john")
  end
end
