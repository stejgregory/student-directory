
# Let's put all the students into an [array]
students = [                                    # This is still a variable
  {name: "Dr. Hannibal Lecter", cohort: :november},           # even though it's an array
  {name: "Darth Vader", cohort: :november},                   # now arrays within an array
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

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
# Nothing happens yet, until we call the methods!!!
print_header
print(students)
print_footer(students)
