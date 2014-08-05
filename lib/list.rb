class List

  def initialize(name, id=nil)
    @name = name
    @id = id
    # @name = hash['name']
    # @id = hash['id']
  end

  def name
    @name
  end

  def id
    @id
  end

  def ==(another_list)
    self.name == another_list.name
  end

  def self.all
    results = DB.exec("SELECT * FROM lists;")
    lists = []
    results.each do |result|
      name = result['name']
      id = result['id']
      # hash = {:name => name, :id => id}
      lists << List.new(name, id)
    end
    lists
  end

  def save
    if List.all.include?(self)
      @unique_list = false
      return false
    else
      results = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
      @id = results.first['id'].to_i
    end
  end

  def delete
    # input_name = name
    DB.exec("DELETE FROM lists WHERE name = '#{@name}';")
  end

  def self.show_lists
  puts "Here are all of your lists:"
  List.all.each do |list|
    puts  "list_name: #{list.name} list_id: #{list.id}"
    end
  end
end
