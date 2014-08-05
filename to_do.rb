# require './spec/spec_helper.rb'
require './lib/task.rb'
require './lib/list.rb'
require 'pg'
require 'pry'
DB = PG.connect(:dbname => 'to_do_test')

puts "Welcome to the to do list."

@current_list = nil

def list_menu
  loop do
    puts "Press 'a' to add a list item"
    puts "Press 'l' to show all your lists"
    puts "Press 't' to list all of your tasks for a list."
    puts "Press 'dt' to delete a task."
    puts "Press 'dl' to delete a list."
    puts "Press 'x' to exit."
    main_choice = gets.chomp
    if main_choice == 'a'
      add_list
    elsif main_choice == 'l'
      show_lists
    elsif main_choice == 'dt'
      delete_task
    elsif main_choice == 'dl'
      delete_list
    elsif main_choice == 'x'
      puts "Good-bye!"
      exit
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end


def add_list
  puts "Enter a name of the new list:"
  input_list_name = gets.chomp
  @input_list_name = input_list_name
  @list = List.new(input_list_name)
  binding.pry
  if @list.save
    @current_list = @list
    puts "List added.\n\n"
    show_lists
    puts "Would you like to add a task to this list(y/n)"
    answer = gets.chomp.downcase
    if answer == 'y'
      add_task
    else
      list_menu
    end
  else
    puts "Please add a unique list name, that name is taken"
    add_list
  end
end

def show_lists
  puts "Here are all of your lists:"
  List.all.each do |list|
    puts  "list_name: #{list.name} list_id: #{list.id}"
  end
  puts "\n"
end


def add_task
  puts "Enter a name of a task:"
  name = gets.chomp
  @task = Task.new(name, @current_list.id)
  @task.save
  puts "Task added \n\n"
  show_tasks
  puts "Would you like to add another task to this list(y/n)"
  answer = gets.chomp.downcase
  if answer == 'y'
    add_task
  else
    list_menu
  end

end

def show_tasks
  puts "Here are all of your tasks for list: #{@list.name}"
  @current_list.tasks.each do |item|
    task_name = @task.name
    puts "task: #{item.name}"
  end
end

def delete_list
  puts "Enter a name of a list to delete:"
  input_name = gets.chomp
  @list.delete
  puts "List deleted \n\n"
end

list_menu
