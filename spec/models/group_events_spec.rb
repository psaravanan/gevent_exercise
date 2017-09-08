require 'rails_helper'

RSpec.describe GroupEvent, type: :model do
  
  it "Should be 0 record" do
    expect(GroupEvent.count).to eq 0
  end

  it "Should be 2 record since draft dont validate any field" do
    GroupEvent.create
    expect(GroupEvent.count).to eq 1
  end

  it "Should create record since 'Publish' and all fields are valid" do
    @ge = GroupEvent.create(name: "My Birthday", description: "Time to celebrate my birthday", start_at: Time.now+1.month, end_at: Time.now+1.month+2.days, location: "Chennai", status: "Publish")
    expect(@ge).to be_valid
  end

  it "Should not create record since status 'Publish' validate all fields and Should be invalid" do
    @ge = GroupEvent.create(status: "Publish")
    expect(@ge).not_to be_valid
  end

  it "Should not create record since Start and End DateTime is invalid" do
    @ge = GroupEvent.create(name: "Engagement", description: "Time to celebrate Engagement", start_at: Time.now+1.month, end_at: Time.now+1.month-2.days, location: "Chennai", status: "Publish")
    expect(@ge).not_to be_valid
  end

end
