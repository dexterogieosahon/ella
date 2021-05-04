RSpec.describe Event, type: :model do
  describe '#timeslots' do
    let(:event) { create(:event, :with_timeslots, timeslots_count: 3) }

    it 'shows all the timeslots in an event' do
      expect(event.timeslots).to have(3).items
    end
  end
end
