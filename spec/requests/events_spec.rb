RSpec.describe "Events", type: :request do

  describe "GET /events" do
    let(:event) { create(:event, :with_timeslots, timeslots_count: 13) }

    context "with an event" do
      it "shows all the time slots" do
        get event_path(event.id)
        res = JSON.parse(response.body)
        expect(res['data']['relationships']['timeslots']['data']).to have(13).items
      end
    end
  end
end
