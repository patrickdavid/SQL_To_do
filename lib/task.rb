require 'pg'

class Task
  def initialize(name, list_id)
    @name = name
    @list_id = list_id
  end

  def name
    @name
  end

  def list_id
    @list_id
  end

  def save
    @current_list = list_id
    DB.exec("INSERT INTO tasks (name, list_id) VALUES ('#{@name}', #{@list_id});")
  end

  def self.all
    results = DB.exec("SELECT * FROM tasks;")
    tasks =[]
    results.each do |result|
      name = result['name']
      list_id = result['list_id'].to_i
      tasks << Task.new(name, list_id)
    end
    tasks
  end

  def ==(another_task)
    self.name == another_task.name && self.list_id == another_task.list_id
  end

  def delete
    @current_list = @list_id
    DB.exec("DELETE FROM tasks WHERE (name = '#{@name}' AND list_id = #{@list_id});")
  end

  def self.show_tasks
  puts "Here are all of your tasks for list: #{@list.name}"
  @current_list.tasks.each do |item|
    task_name = @task.name
    puts "task: #{item.name}"
    end
  end
end

