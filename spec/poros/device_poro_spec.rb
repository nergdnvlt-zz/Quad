require 'rails_helper'

describe Device do
  describe 'it initializes' do
    it 'with attributes' do
      loc_attrs = {
        id: 1,
        lat: 39.95,
        long: -105.5,
        distance: 8,
        timestamp: 'blah'
      }
      Device = Device.new(attrs)

      expect(location).to be_a LastLocation
      expect(location.id).to eq(attrs[:id])
      expect(location.location_latitude).to eq(attrs[:lat])
      expect(location.location_longitude).to eq(attrs[:long])
      expect(location.distance).to eq(attrs[:distance])
      expect(location.time).to eq(attrs[:timestamp])
    end
  end
end
