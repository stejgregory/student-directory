def input_students
  puts "Please enter the name of the first student you wish to add"
  puts "*** To finish, just hit return without typing a new students name ***"
  # Create an empty array
  students = []

  # Get the first students details
  name = gets.chomp
  # While the name is not empty, repeat this code
  while !name.empty? do
    puts "Which cohort 'Month' will #{name} be enrolling with?"
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
    else
      puts "Now we have #{students.count} students"
    end
    puts "*** Who's next? ***"
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
      count_and_name = "#{count+1}. #{students[count][:name]}"
      cohort = "Cohort: #{students[count][:cohort]}"
      hobby = "Hobby: #{students[count][:hobby]}"
      country = "County of birth: #{students[count][:country]}"
      height = "Height: #{students[count][:height]}"
        puts count_and_name + cohort.center(20) + hobby.center(20) + country.center(20) + height.center(20)
        puts
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
