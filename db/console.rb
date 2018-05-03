require_relative('../models/Student')

# student1 = Student.new({
#   "first_name": "Barry",
#   "second_name": "White",
#   "house_name": "Hufflepuff",
#   "age": 69
# })

# student1.save()

# student2 = Student.new({
#   "first_name": "Stephanie",
#   "second_name": "Brown",
#   "house_name": "Ravenclaw",
#   "age": 35
# })

# student2.save()

p Student.find(2)