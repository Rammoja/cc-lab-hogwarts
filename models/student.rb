require_relative('../db/sql_runner')

class Student
  attr_reader :id, :house_name
  attr_accessor :first_name, :second_name, :house_id, :age

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @first_name = options["first_name"]
    @second_name = options["second_name"]
    @house_name = options["house_name"]
    @house_id = options["house_id"].to_i
    @age = options["age"]
  end

  def save()
    sql = "INSERT INTO students (first_name,second_name,house_id,age) VALUES ($1,$2,$3,$4) RETURNING id;"
    values = [@first_name, @second_name, @house_id, @age]
    @id = SqlRunner.run(sql,values).first()['id'].to_i
  end

  def self.find_all()
    students = SqlRunner.run("SELECT students.*, houses.house_name FROM students
      INNER JOIN houses
      ON houses.id = students.house_id;")
    return self.map_items(students)
  end
  
  def self.find(id)
    sql = "SELECT students.*, houses.house_name FROM students
      INNER JOIN houses
      ON houses.id = students.house_id
      WHERE students.id=$1;"
    values = [id]
    student = SqlRunner.run(sql, values)
    result = self.new(student.first)
    return result 
  end 

  def self.delete_all()
    SqlRunner.run("DELETE FROM students;")
  end
  
    def self.map_items(items)
      return items.map { |item| self.new(item) }
    end
end