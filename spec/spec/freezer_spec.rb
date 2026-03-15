require_relative '../lib/freezer'
require_relative '../lib/item'

describe 'A freezer' do

  it 'has a default capacity and room temperature' do
    freezer = Freezer.new
    expect(freezer.capacity).to eq(100)
    expect(freezer.temperature).to eq(Freezer::ROOM_TEMPERATURE)
  end

  it 'can be initialized with a custom capacity' do
    freezer = Freezer.new(200)
    expect(freezer.capacity).to eq(200)
  end

  it 'has full remaining capacity when empty' do
    freezer = Freezer.new(100)
    expect(freezer.remaining_capacity).to eq(100)
  end

  it 'reduces remaining capacity when an item is added' do
    freezer = Freezer.new(100)
    item = Item.new('Ice Cream', 10)

    freezer.add(item)

    expect(freezer.remaining_capacity).to eq(90)
  end

  it 'changes temperature when the level is set' do
    freezer = Freezer.new

    freezer.set_level(2)

    expect(freezer.temperature).to eq(Freezer::ROOM_TEMPERATURE - 20)
  end

end