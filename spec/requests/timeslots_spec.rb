RSpec.describe "Timeslots", type: :request do

  describe "Timeslots" do
    context "with an event\'s user bookmarked slots" do
      before do
        @event = create(:event, :with_timeslots, timeslots_count: 13)
        create(:event, :with_timeslots, timeslots_count: 4)
        @users = create_list(:user, 5)
        @timeslot = create(:timeslot, event: @event)
      end

      context "with no user bookmarked timeslots" do
        it "has no associated user records" do
          get(event_timeslot_path(@event.id, @timeslot.id))
          res = JSON.parse(response.body)
          expect(res['data']['relationships']['users']['data']).to have(0).items
        end
      end

      context "with user bookmarked timeslots" do
        it "has associated user records" do
          TimeslotUser.bookmark(@users[0], @timeslot, 'reserved')
          TimeslotUser.bookmark(@users[3], @timeslot, 'reserved')

          get(event_timeslot_path(@event.id, @timeslot.id))
          res = JSON.parse(response.body)
          expect(res['data']['relationships']['users']['data']).to have(2).items
        end
      end
    end
  end
end
