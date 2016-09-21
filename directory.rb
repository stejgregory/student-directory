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
    puts "Now we have  #{students.count} students"
    # Get another name from the user
    name = gets.chomp
  end
  # Return the array of the students
  students
end

def print_header
puts "The students of Villains Academy"
puts "-------------"
end

def print(students)                  # We can now call this method and pass in 'students' array
  students.each do |student|         # For each iteration of the array 'students'
    puts "#{student[:name]} (#{student[:cohort]} cohort)"     # it is assigned to the variable |student|
  end                                               # and the code between do-end is executed.
end   #also end method

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
# Nothing happens yet, until we call the methods!!!
print_header
print(students)
print_footer(students)
