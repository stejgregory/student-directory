def input_students
  puts "Please enter the name of the first student you wish to add into our database"
  puts "*** To finish, just hit return without typing a new students name ***"
  # Create an empty array
  students = []

  # Get the first students details
  name = gets.chomp
  # While the name is not empty, repeat this code
  while !name.empty? do
    name2 = name.split.map(&:capitalize)*' '
    puts "Which 'month' cohort will #{name2} be enrolling on?"
    cohort = gets.chomp.capitalize
    @months = ["January", "February", "March",
              "April", "May", "June", "July",
              "August", "September", "October",
              "November", "December"]
    until @months.include? cohort
    puts "You entered #{cohort}. Please enter a valid month."
    cohort = gets.chomp.capitalize!
    end

    puts "What is #{name2}'s main hobby?"
    hobby = gets.chomp.capitalize
    if hobby == ""
      hobby = "Not provided"
    end

    puts "What country was #{name2} born in?"
    country = gets.chomp.capitalize
    if country == ""
      county = "Not Provided"
    end

    puts "Last question, how tall is #{name2} in centimetres?"
    height = gets.chomp
    if height == ""
      height = "Not provided"
    end

    # Add the student hash AND ALL THE VARIABLES to the array!!!
    students << {
      name: name2.to_sym,
      cohort: cohort.to_sym,
      hobby: hobby.to_sym,
      country: country.to_sym,
      height: height.to_sym}

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
puts "--------------------------------"
end


def print(students)
  if students == 0
    puts "Your list of students is empty"
  else
    count = 0
    until count == students.length
        count_and_name = "#{count+1}. #{students[count][:name]}"
        cohort = "Cohort: #{students[count][:cohort]}"
        hobby = "Hobby: #{students[count][:hobby]}"
        country = "County of birth: #{students[count][:country]}"
        height = "Height: #{students[count][:height]}"
        puts count_and_name.center(30) + cohort.center(20) + hobby.center(20) + country.center(20) + height.center(20)
        count +=1         #[count] in each array iteration calls it from the main array
    end                 # We then ask for the specific part of the iteration.
  end
  puts ""
end


def print_cohort(students)
  if students.count <= 0
    puts "No cohorts to print either"
  else
  @months.each do |month_to_list|
    puts "#{month_to_list} cohort:"
    puts "------------------------"
    students.each do |students|
      if students[:cohort].to_s == month_to_list
          name = "#{students[:name]}"
          cohort = "Cohort: #{students[:cohort]}"
          hobby = "Hobby: #{students[:hobby]}"
          country = "County of birth: #{students[:country]}"
          height = "Height: #{students[:height]}"
              puts name.center(30) + cohort.center(20) + hobby.center(20) + country.center(20) + height.center(20)
        end
      end
    end
    puts ""
  end
end


def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student"
  else names.count > 1
    puts "Overall, we have #{names.count} great students"
  end
end

students = input_students
# Nothing happens yet, until we call the methods!!!
print_header
print(students)
print_cohort(students)
print_footer(students)
