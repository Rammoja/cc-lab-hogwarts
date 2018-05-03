require_relative('../db/sql_runner')

class House
  attr_reader :id
  attr_accessor :house_name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @house_name = options["house_name"]
  end

  def save()
    sql = "INSERT INTO houses (house_name) VALUES ($1) RETURNING id;"
    values = [@house_name]
    @id = SqlRunner.run(sql,values).first()['id'].to_i
  end

  def self.find_all()
    houses = SqlRunner.run("SELECT * FROM houses;")
    return self.map_items(houses)
  end
  
  def self.find(id)
    sql = "SELECT * from houses WHERE id=$1;"
    values = [id]
    house = SqlRunner.run(sql, values)
    result = self.new(house.first)
    return result 
  end 

  def self.delete_all()
    SqlRunner.run("DELETE FROM houses;")
  end
  
    def self.map_items(items)
      return items.map { |item| self.new(item) }
    end
end