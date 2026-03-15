require_relative '../lib/refrigerator'
require_relative '../lib/chiller'
require_relative '../lib/freezer'
require_relative '../lib/item'

describe 'A refrigerator' do

  it 'has a chiller, freezer, water dispenser, and water reservoir' do
    chiller = Chiller.new(100)
    freezer = Freezer.new(50)
    water_dispenser = double('water_dispenser')
    water_reservoir = double('water_reservoir')

    refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)

    expect(refrigerator.chiller).to eq(chiller)
    expect(refrigerator.freezer).to eq(freezer)
    expect(refrigerator.water_dispenser).to eq(water_dispenser)
    expect(refrigerator.water_reservoir).to eq(water_reservoir)
  end

  it 'can chill an item' do
    chiller = Chiller.new(100)
    freezer = Freezer.new(50)
    water_dispenser = double('water_dispenser')
    water_reservoir = double('water_reservoir')

    refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)
    item = Item.new('Milk', 10)

    refrigerator.chill(item)

    expect(chiller.remaining_capacity).to eq(90)
  end

  it 'can freeze an item' do
    chiller = Chiller.new(100)
    freezer = Freezer.new(50)
    water_dispenser = double('water_dispenser')
    water_reservoir = double('water_reservoir')

    refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)
    item = Item.new('Ice Cream', 10)

    refrigerator.freeze(item)

    expect(freezer.remaining_capacity).to eq(40)
  end

  it 'has a total capacity based on chiller and freezer capacity' do
    chiller = Chiller.new(100)
    freezer = Freezer.new(50)
    water_dispenser = double('water_dispenser')
    water_reservoir = double('water_reservoir')

    refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)

    expect(refrigerator.total_capacity).to eq(150)
  end

  it 'has remaining capacity based on chiller and freezer remaining capacity' do
    chiller = Chiller.new(100)
    freezer = Freezer.new(50)
    water_dispenser = double('water_dispenser')
    water_reservoir = double('water_reservoir')

    refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)
    refrigerator.chill(Item.new('Milk', 10))
    refrigerator.freeze(Item.new('Peas', 5))

    expect(refrigerator.remaining_capacity).to eq(135)
  end

  it 'can set the chiller level' do
    chiller = Chiller.new(100)
    freezer = Freezer.new(50)
    water_dispenser = double('water_dispenser')
    water_reservoir = double('water_reservoir')

    refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)

    refrigerator.set_chiller_level(2)

    expect(chiller.temperature).to eq(Chiller::ROOM_TEMPERATURE - 10)
  end

  it 'can set the freezer level' do
    chiller = Chiller.new(100)
    freezer = Freezer.new(50)
    water_dispenser = double('water_dispenser')
    water_reservoir = double('water_reservoir')

    refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)

    refrigerator.set_freezer_level(2)

    expect(freezer.temperature).to eq(Freezer::ROOM_TEMPERATURE - 20)
  end

end