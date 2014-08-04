
require '../lib/task'
require '/lib/list'

puts "welcome to the to do list"

puts List.all

def main_menu
  loop do
    puts "Press 'a' to add a task or 'l' to list all of your tasks."
    puts "Press 'x' to exit."
    main_choice = gets.chomp
    if main_choice == 'a'
      add_task
    elsif main_choice == 'l'
      list_tasks
    elsif main_choice == 'x'
      puts "Good-bye!"
      exit
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end

def add_list
  puts "Enter a description of the new list:"
  name = gets.chomp
  @lists << Task.new(name, list_id)
  puts "Task added.\n\n"
end

def list_tasks
  puts "Here are all of your tasks:"
  @list.each do |task|
    puts task.name
  end
  puts "\n"
end
