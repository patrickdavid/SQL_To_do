# require './spec/spec_helper.rb'
require './lib/task.rb'
require './lib/list.rb'
require 'pg'

DB = PG.connect(:dbname => 'to_do_test')

puts "welcome to the to do list"

# puts @@list

# def list_menu
#   loop do
#     puts "Press 'a' to add a list item or 'l' to list all of your lists."
#     puts "Press 'x' to exit."
#     main_choice = gets.chomp
#     if main_choice == 'a'
#       add_list
#     elsif main_choice == 'l'
#       show_lists
#     elsif main_choice == 'x'
#       puts "Good-bye!"
#       exit
#     else
#       puts "Sorry, that wasn't a valid option."
#     end
#   end
# end

def task_menu
  loop do
    puts "Press 'a' to add a task item or 'l' to list all of your tasks in the list.  Press 'dt' to delete task.  Press 'dl' to delete list"
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
  name = gets.chomp
  @list = List.new(name)
  @list.save
  puts "List added.\n\n"
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
  @task = Task.new(name, list_id)
  @task.save
  puts "Task added \n\n"
end

def show_tasks
  puts "Here are all of your tasks for list: #{@list.name}"
  Task.all.each do |list|
    puts "task_name: #{@name}"
  end
  puts "do "
end

def delete_task
  puts "Enter a name of a task to delete:"
  input_name = gets.chomp
  @task.delete(input_name)
  puts "Task deleted \n\n"
end

task_menu
