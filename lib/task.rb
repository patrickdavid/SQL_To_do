require 'pg'

class Task
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def save
    database = PG.connect(:dbname => 'to_do')
    database.exec("INSERT INTO tasks (name) VALUES ('#{@name}');")
  end

  def self.all
    database = PG.connect(:dbname => 'to_do')
    results = database.exec("SELECT * FROM tasks;")
    tasks =[]
    results.each do |result|
      name = result['name']
      tasks << Task.new(name)
    end
    tasks
  end

  def ==(another_task)
    self.name == another_task.name
  end
end

