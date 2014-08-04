
require 'list'
require 'rspec'
require 'pg'

DB = PG.connect(:dbname => 'to_do_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
  end
end

describe List do
  it'is initialized with a name' do
    list = List.new('Epicodus Stuff')
    expect(list).to be_an_instance_of List
  end

  it 'tells you its name' do
    list = List.new('Epicodus Stuff')
    expect(list.name).to eq 'Epicodus Stuff'
  end

  it 'is the same list if it has the same name' do
    list1 = List.new('Epicodus Stuff')
    list2 = List.new('Epicodus Stuff')
    expect(list1).to eq list2
  end

end
