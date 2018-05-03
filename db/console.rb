require_relative('../models/Student')
require_relative('../models/House')

Student.delete_all()
House.delete_all()

ravenclaw = House.new({
  "house_name" => "Ravenclaw"
})

ravenclaw.save()

slytherin = House.new({
  "house_name" => "Slytherin"
})

slytherin.save()

gryffindor = House.new({
  "house_name" => "Gryffindor"
})

gryffindor.save()

hufflepuff = House.new({
  "house_name" => "Hufflepuff"
})

hufflepuff.save()

student1 = Student.new({
  "first_name" => "Barry",
  "second_name" => "White",
  "house_id" => hufflepuff.id,
  "age" => 69
})

student1.save()

student2 = Student.new({
  "first_name" => "Stephanie",
  "second_name" => "Brown",
  "house_id" => ravenclaw.id,
  "age" => 35
})

student2.save()