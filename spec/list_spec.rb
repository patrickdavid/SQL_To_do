require 'spec_helper'

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

  it 'starts off with no lists' do
    expect(List.all).to eq []
  end

  it 'lets you save lists to the database' do
    list = List.new('Epicodus Stuff')
    list.save
    expect(List.all).to eq [list]
  end

  it 'will not save a if there is already one with the same name saved' do
    list = List.new('Epicodus Stuff')
    list.save
    another_list = List.new('Epicodus Stuff')
    expect(another_list.save).to eq false
  end

  it 'sets its ID when you save it' do
    list = List.new('Epicodus Stuff')
    list.save
    expect(list.id).to be_an_instance_of Fixnum
  end

  it 'will remove a list' do
    list1 = List.new('Home', 1)
    list2 = List.new('School', 2)
    list1.save
    list2.save
    list1.delete
    expect(List.all).to eq [list2]
  end
end
