class Tea

  def flavor
    "earl_grey".to_sym
  end

  def tempature
    205.0
  end
end

RSpec.configure do |config|
  config.example_status_persistence_file_path = "spec/examples.txt"
end

RSpec.describe Tea do
  let(:tea) { Tea.new }

  it 'tasts like Earl Grey' do
    expect(tea.flavor).to be :earl_grey
  end

  it 'is hot' do
    expect(tea.tempature).to be > 200.0
  end
end