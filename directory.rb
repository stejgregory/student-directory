def input_students_details
  puts "Please enter the name of the first student you wish to add"
  puts "*** To finish, just hit return without typing a new students name ***"
  # Create an empty array
  students = []

  # Get the first students details
  name = gets.chomp
  # While the name is not empty, repeat this code
  while !name.empty? do
    puts "Which cohort 'month' will #{name} be enrolling with?"
    month = gets.chomp
    puts "What is #{name}'s main hobby?"
    hobby = gets.chomp
    puts "What country was #{name} born in?"
    country = gets.chomp
    puts "Last question, how tall is #{name} in centimetres?"
    height = gets.chomp
    # Add the student hash AND ALL THE VARIABLES to the array!!!
    students << {
      name: name,
      cohort: month,
      hobby: hobby,
      country: country,
      height: height}
    if students.count == 1
      puts "Now we have #{students.count} student"
      puts "*** Who's next? ***"
    else
      puts "Now we have #{students.count} students"
      puts "*** Who's next? ***"
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
      puts "#{count+1}. #{students[count][:name]} / Cohort:#{students[count][:cohort]} / Hobby:#{students[count][:hobby]} / CountryOfBirth:#{students[count][:country]} / Height:#{students[count][:height]}"
      count +=1         #[count] in each array iteration calls it from the main array
    end                 # We then ask for the specific part of the iteration.
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students_details
# Nothing happens yet, until we call the methods!!!
print_header
print(students)
print_footer(students)
