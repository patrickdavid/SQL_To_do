require 'spec_helper'

describe Task do
  it 'is initialized with a name and a list ID' do
    task = Task.new('learn SQL', 1)
    expect(task).to be_an_instance_of Task
  end

  it 'tells you its name' do
    task = Task.new('learn SQL', 1)
    expect(task.name).to(eq('learn SQL'))
  end

  it 'tells you its list id' do
    task = Task.new('learn SQL', 1)
    expect(task.list_id).to eq 1
  end

  it 'starts with no tasks' do
    expect(Task.all).to eq []
  end

  it 'lets you save tasks into the database' do
    task = Task.new('learn SQL', 1)
    task.save
    expect(Task.all).to eq [task]
  end

  it 'is the same task if it has the same name anmd list ID' do
    task1 = Task.new('learn SQL', 1)
    task2 = Task.new('learn SQL', 1)
    expect(task1).to eq task2
  end

  it 'will remove the task from the list' do
    task1 = Task.new('learn SQL', 1)
    task2 = Task.new('learn PHP', 2)
    task1.save
    task2.save
    task1.delete
    expect(Task.all).to eq [task2]
  end

  it 'will show all the task of a given list' do
    list1 = List.new('Home')
    list1.save
    task1 = Task.new('learn SQL', 1)
    task2 = Task.new('learn Adobe', 1)
    task3 = Task.new('learn things', 1)
    task1.save
    task2.save
    task3.save
    expect(Task.show_tasks).to eq [task1,task2, task3]
  end
end
