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
puts "The students of Villains Academy"
puts "-------------"
end

def print(students)
  count = 0
  until count == students.length
      puts "#{count+1}. #{students[count][:name]} (#{students[count][:cohort]} cohort)"
      count +=1         #[count] in each array iteration calls it from the main array
    end                 # We then ask for the specific part of the iteration.
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
# Nothing happens yet, until we call the methods!!!
print_header
print(students)
print_footer(students)
