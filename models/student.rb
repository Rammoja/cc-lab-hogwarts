require_relative('../db/sql_runner')

class Student
  attr_reader :id
  attr_accessor :first_name, :second_name, :house_name, :age

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @first_name = options["first_name"]
    @second_name = options["second_name"]
    @house_name = options["house_name"]
    @age = options["age"]
  end

  def save()
    sql = "INSERT INTO students (first_name,second_name,house_name,age) VALUES ($1,$2,$3,$4) RETURNING id;"
    values = [@first_name, @second_name, @house_name, @age]
    @id = SqlRunner.run(sql,values).first()['id'].to_i
  end

  def self.find_all()
    students = SqlRunner.run("SELECT * FROM students;")
    return self.map_items(students)
  end

  def self.map_items(items)
    return items.map { |item| self.new(item) }
  end
end