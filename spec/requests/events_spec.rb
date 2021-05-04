RSpec.describe "Events", type: :request do

  describe "GET /events" do
    context "without an event" do
      before do
        create(:event, :with_timeslots, timeslots_count: 13)
        create(:event, :with_timeslots, timeslots_count: 4)
      end

      it "shows all the events with their time slots" do
        get(events_path)
        res = JSON.parse(response.body)
        expect(res['data']).to have(2).items
      end
    end

    context "with an event" do
      let(:event) { create(:event, :with_timeslots, timeslots_count: 13) }

      it "shows all the time slots" do
        get(event_path(event.id))
        res = JSON.parse(response.body)
        expect(res['data']['relationships']['timeslots']['data']).to have(13).items
      end

      context "without an authenticated user" do
        let(:event) { create(:event, :with_timeslots, timeslots_count: 13) }

        it "does not show all the time slots with the current user\'s active meetings" do
          get(user_events_path(event.id))
          expect(response.status).to eq 401
        end
      end

      context "with an authenticated user" do
        let(:current_user) { create(:user) }
        let(:event) { create(:event, :with_timeslots, timeslots_count: 13) }

        it "shows all the time slots for the current user" do
          get(user_events_path(event.id), headers: { 'Authorization': current_user.id })
          res = JSON.parse(response.body)
          expect(res['data']['relationships']['timeslots']['data']).to have(13).items
        end

        context "with active meetings" do
          let(:timeslot) { create(:timeslot, event: event) }
          let(:meetings) { create_list(:meeting, 21, timeslot: timeslot) }
          before do
            meetings[0..3].each { |meeting| MeetingUser.invite(current_user, meeting, 'pending') }
            meetings[4..7].each { |meeting| MeetingUser.invite(current_user, meeting, 'accepted') }
            meetings[8..13].each { |meeting| MeetingUser.invite(current_user, meeting, 'rejected') }
            meetings[14..17].each { |meeting| MeetingUser.invite(current_user, meeting, 'cancelled') }
            meetings[18..21].each { |meeting| MeetingUser.invite(current_user, meeting, 'rescheduled') }
          end

          it "shows all the time slots with the current user\'s active meetings" do
            get(user_event_timeslot_path(event.id, timeslot.id), headers: { 'Authorization': current_user.id })
            res = JSON.parse(response.body)
            expect(res['data']['relationships']['meetings']['data']).to have(11).items
          end
        end
      end
    end
  end
end
