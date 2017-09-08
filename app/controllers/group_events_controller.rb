class GroupEventsController < ApplicationController

  def index
    @gevents = GroupEvent.active
  end

  def new
    @gevent = GroupEvent.new
    @random_events = GroupEvent.random_five
  end

  def create
    @gevent = GroupEvent.new(gevent_params)
    if @gevent.save
      redirect_to group_events_path
    else
      @random_events = GroupEvent.random_five
      render "new"
    end
  end

  private

  def gevent_params
    params.require(:group_event).permit(:name, :description, :start_at, :end_at, :location, :status)
  end

end
