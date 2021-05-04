class TimeslotsController < BaseController
  before_action :set_timeslot, only: [:show]

  def show
    render json: TimeslotSerializer.new(@timeslot, { params: { current_user: current_user }})
  end

  private
  def set_timeslot
    @timeslot = Timeslot.where(event_id: params[:event_id], id: params[:id]).first
  end
end
