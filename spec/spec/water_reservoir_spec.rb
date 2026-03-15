require_relative '../lib/water_reservoir'

describe 'A water reservoir' do

  it 'has a capacity and current water volume' do
    reservoir = WaterReservoir.new(10, 5)

    expect(reservoir.capacity).to eq(10)
    expect(reservoir.current_water_volume).to eq(5)
  end

  it 'is empty when current water volume is zero' do
    reservoir = WaterReservoir.new(10, 0)

    expect(reservoir).to be_empty
  end

  it 'is not empty when it has water' do
    reservoir = WaterReservoir.new(10, 5)

    expect(reservoir).to_not be_empty
  end

  it 'can be filled to its capacity' do
    reservoir = WaterReservoir.new(10, 0)

    reservoir.fill

    expect(reservoir.current_water_volume).to eq(10)
  end

  it 'reduces water volume when drained' do
    reservoir = WaterReservoir.new(10, 8)

    reservoir.drain(3)

    expect(reservoir.current_water_volume).to eq(5)
  end

end