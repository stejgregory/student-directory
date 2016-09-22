def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # Create an empty array
  students = []
  # Get the first students names
  name = gets.chomp
  # While the name is not empty, repeat this code
  while !name.empty? do
    # Add the student hash to the array
    students << {name: name, cohort: :november}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    # Get another name from the user
    name = gets.chomp
  end
  # Return the array of the students
  students
end

def print_header
puts "The students of Villains Academy - with names shorter than 12 characters"
puts "-------------"
end

def print(students)
  students.each_with_index{|student, index|
    if student[:name].length < 12               # .count didn't work here
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
# Nothing happens yet, until we call the methods!!!
print_header
print(students)
print_footer(students)
