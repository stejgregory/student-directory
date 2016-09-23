@students = []  # An empty array @accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)   # This blew my mind!!!!
  end
end


def print_menu
  puts "What would you like to do?"
  puts "--------------------------"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"   # Because we'll be adding more options
  puts ""
end


def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      Exit # HERE THE PROGRAM WILL TERMINATE
    else
      puts " I don't know what you mean, try again"
  end
end


def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student [:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end


def show_students
  print_header
  print_students_list
  print_footer
end


def input_students
  puts "Please enter the name of the first student you wish to add into our database"
  puts "*** To finish, just hit return without typing a new students name ***"
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
    puts "You entered '#{cohort}'. Please enter a valid month."
    cohort = gets.chomp.capitalize
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
    @students << {
      name: name2.to_sym,
      cohort: cohort.to_sym,
      hobby: hobby.to_sym,
      country: country.to_sym,
      height: height.to_sym}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    puts "*** Who's next? ***"
    # Get another name from the user
    name = gets.chomp
  end
  # No longer need to return students variable, we can access this @students
end


def print_header
puts "The students of Villains Academy"
puts "--------------------------------"
end


def print_students_list
  if @students == 0
    puts "Your list of students is empty"
  else
    count = 0
    until count == @students.length
        count_and_name = "#{count+1}. #{@students[count][:name]}"
        cohort = "Cohort: #{@students[count][:cohort]}"
        hobby = "Hobby: #{@students[count][:hobby]}"
        country = "County of birth: #{@students[count][:country]}"
        height = "Height: #{@students[count][:height]}"
        puts count_and_name.center(30) + cohort.center(20) + hobby.center(20) + country.center(20) + height.center(20)
        count +=1         #[count] in each array iteration calls it from the main array
    end                 # We then ask for the specific part of the iteration.
  end
  puts ""
end


def print_cohort
  if @students.count <= 0
    puts "No cohorts to print either"
  else
  @months.each do |month_to_list|
    puts "#{month_to_list} cohort:"
    puts "------------------------"
    @students.each do |students|
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
  end
end


def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  else @students.count > 1
    puts "Overall, we have #{@students.count} great students"
  end
  puts ""
end

# Nothing happens yet, until we call the methods!!!
# print_cohort(students)

interactive_menu
