require_relative '../lib/water_dispenser'
require_relative '../lib/vessel'

describe 'A water dispenser' do

  it 'has a reservoir' do
    reservoir = double('reservoir')
    dispenser = WaterDispenser.new(reservoir)

    expect(dispenser.reservoir).to eq(reservoir)
  end

  it 'drains the reservoir when dispensing into a vessel' do
    reservoir = double('reservoir')
    vessel = Vessel.new('Cup', 10)

    expect(reservoir).to receive(:drain).with(10)

    dispenser = WaterDispenser.new(reservoir)
    dispenser.dispense(vessel)
  end

end