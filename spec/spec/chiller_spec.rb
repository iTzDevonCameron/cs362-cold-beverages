require_relative '../lib/chiller'
require_relative '../lib/item'

describe 'A chiller' do

  it 'has a default capacity and room temperature' do
    chiller = Chiller.new
    expect(chiller.capacity).to eq(100)
    expect(chiller.temperature).to eq(Chiller::ROOM_TEMPERATURE)
  end

  it 'can be initialized with a custom capacity' do
    chiller = Chiller.new(200)
    expect(chiller.capacity).to eq(200)
  end

  it 'has full remaining capacity when empty' do
    chiller = Chiller.new(100)
    expect(chiller.remaining_capacity).to eq(100)
  end

  it 'reduces remaining capacity when an item is added' do
    chiller = Chiller.new(100)
    item = Item.new('Milk', 10)

    chiller.add(item)

    expect(chiller.remaining_capacity).to eq(90)
  end

  it 'can change temperature level' do
    chiller = Chiller.new

    chiller.set_level(2)

    expect(chiller.temperature).to eq(Chiller::ROOM_TEMPERATURE - 10)
  end

end