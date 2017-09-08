require 'rails_helper'

RSpec.describe Api::V1::GroupEventsController, :type => :controller do

  context '.index' do
    it 'creates new employment record' do
      response.status.should eq(200)
    end
  end

end