
# Let's put all the students into an [array]
students = [                              # This is still a variable
  "Dr. Hannibal Lecter",                  # even though it's an array
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

def print_header
puts "The students of Villains Academy"
puts "-------------"
end

def print(names)                  # We can now call this method and pass in 'students' array
  names.each do |name|            # For each iteration of the array 'students'
    puts name                     # it is assigned to the variable |student|
  end                             # and the code between do-end is executed.
end   #also end method

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
# Nothing happens yet, until we call the methods!!!
print_header
print(students)
print_footer(students)
