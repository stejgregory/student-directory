@students = []  # An empty array @accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)   # This blew my mind!!!!
  end
end


def print_menu
  puts "What would you like to do?"
  puts "--------------------------"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from sudents.csv"
  puts "5. Show the students, grouped in their respective cohorts"
  puts "9. Exit"
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
    when "4"
      load_students
    when "5"
      print_cohort
    when "9"
      Exit # HERE THE PROGRAM WILL TERMINATE
    else
      puts " I don't know what you mean, try again"
  end
end

# ---------- 1 ----------
def input_students
  puts "Please enter the name of the first student you wish to add into our database"
  puts "*** To finish, just hit return without typing a new students name ***"
  # Get the first students details
  name = STDIN.gets.chomp.capitalize
  # While the name is not empty, repeat this code
  while !name.empty? do
    puts "Which 'month' cohort will #{name} be enrolling on?"
    cohort = STDIN.gets.chomp.capitalize
    @months = ["January", "February", "March",
              "April", "May", "June", "July",
              "August", "September", "October",
              "November", "December"]
    until @months.include? cohort
    puts "You entered '#{cohort}'. Please enter a valid month."
    cohort = STDIN.gets.chomp.capitalize
    end
    puts "What is #{name}'s main hobby?"
    hobby = STDIN.gets.chomp.capitalize
    if hobby == ""
      hobby = "Not provided"
    end
    puts "What country was #{name} born in?"
    country = STDIN.gets.chomp.capitalize
    if country == ""
      county = "Not Provided"
    end
    puts "Last question, how tall is #{name} in centimetres?"
    height = STDIN.gets.chomp
    if height == ""
      height = "Not provided"
    end
    # Add the student hash AND ALL THE VARIABLES to the array!!!
    @students << {name: name,
                  cohort: cohort.to_sym,
                  hobby: hobby,
                  country: country,
                  height: height}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    puts "*** Who's next? ***"
    # Get another name from the user
    name = STDIN.gets.chomp.capitalize
  end
  # No longer need to return students variable, we can access this @students
end


# ---------- 2 ----------
def show_students
  print_header
  print_students_list
  print_footer
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

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  else @students.count > 1
    puts "Overall, we have #{@students.count} great students"
  end
  puts ""
end


# ---------- 3 ----------
def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student [:cohort],
                    student [:hobby], student [:country],
                    student [:height]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  file.close
  puts "Student list SAVED to students.csv"
  puts ""
end


# ---------- 4 ----------
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, hobby, country, height = line.chomp.split(',')
    @students << {name: name,
                  cohort: cohort.to_sym,
                  hobby: hobby,
                  country: country,
                  height: height}
  end
  file.close
  puts "Student list LOADED from student.csv"
  puts ""
end


# ---------- 5 ----------
def print_cohort
  if @students.count <= 0
    puts "No cohorts to print yet"
    puts ""
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
              puts ""
        end
      end
    end
  end
end


def try_load_students
  filename = ARGV.first # First argument from the command line!
  return if filename.nil? # Get out of this method if they never supplied a filename argument in the command line
  if File.exists?(filename) # If it exists
    load_students(filename)
      puts "Loaded #{@student.count} from #{filename}"
  else # If it doesn't exist
      puts "Sorry, #{filename} doesn't exist."
      exit # Quit the program
  end
end

# Nothing happens yet, until we call the methods!!!
# print_cohort(students)    STILL NOT USING THIS METHOD IN THE INTERACTIVE MENU YET

try_load_students
interactive_menu
