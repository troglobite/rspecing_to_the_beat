class Coffee
  BASE = 1.00

  def ingredients
    @ingredients ||= []
  end

  def add(ingredient)
    ingredients << ingredient
  end

  def price
    BASE + (ingredients.count * 0.25)
  end

  def color
    ingredients.include?(:milk) ? :light : :dark
  end

  def tempature
    ingredients.include?(:milk) ? 190.0 : 205.0
  end
end

RSpec.configure do |config|
  config.filter_run_when_matching(focus: true)
  config.example_status_persistence_file_path = 'spec/examples.txt'
end

RSpec.describe 'A cup of coffee' do
  let(:coffee) { Coffee.new }

  it 'costs $1' do
    expect(coffee.price).to eq(1.00)
  end
  
  context 'with milk' do
    before { coffee.add :milk }

    it 'costs $1.25' do
      expect(coffee.price).to eq(1.25)
    end

    it 'is lighter in color' do
      # pending 'Color not implemented yet'
      expect(coffee.color).to be(:light)
    end

    it 'is cooler then 200 degress' do
      # pending 'Tempature not implemented yet'
      expect(coffee.tempature).to be < 200.0
    end
  end
end