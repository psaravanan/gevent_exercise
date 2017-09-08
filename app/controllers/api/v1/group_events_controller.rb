class Api::V1::GroupEventsController < Api::V1::ApiController

  def index
    ge = GroupEvent.all
    render_success(size: ge.size, gevents: ge)
  end
  
end