require 'rubygems'
require 'yaml'

class Person
  attr_accessor :name
  attr_accessor :email
  attr_accessor :github_user
  attr_accessor :twitter
  attr_accessor :fun_fact
  attr_accessor :favorite_food

  def initialize
    self.get_person_info
  end

  def self.create_person(type)
    case type
    when "Student"
      Student.new
    when "Instructor"
      Instructor.new
    else
      nil
    end     
  end

  def get_person_info
    print "What is your name? "
    self.name = gets.strip.chomp
    print "What is your email? "
    self.email = gets.strip.chomp
    print "What is your github user ID? "
    self.github_user = gets.strip.chomp
    print "What is your twitter account? "
    self.twitter = gets.strip.chomp
    print "Tell us a fun fact about you: "
    self.fun_fact = gets.strip.chomp
    print "What is your favorite food? "
    self.favorite_food = gets.strip.chomp
  end

end

class Student < Person
  attr_accessor :reason_for_joining
  attr_accessor :objective_after

  def get_person_info
    super
    print "What was your reasong for joining WDI? "
    self.reason_for_joining = gets.strip.chomp
    print "What is your objective after the course? "
    self.objective_after = gets.strip.chomp
  end

end

class Instructor < Person
  attr_accessor :instructor_type
  attr_accessor :life_befroe_GA

  def get_person_info
    super
    print "What type of instructor are you? "
    self.instructor_type = gets.strip.chomp
    print "What was yuor life before GA like? "
    self.life_befroe_GA = gets.strip.chomp
  end

end

@directory = ""
puts "Student Directory, v0.0.2 by Oren"
print "Enter Student or Instructor, q to save and quit: "

while ((input = gets.strip.chomp) != 'q') do

  someone = Person.create_person(input)
  
  ###### don't change the rest for now:

  # Append this to our yaml file
  @directory += someone.to_yaml
  puts @directory
  
  print "Enter Student or Instructor, q to save and quit: "
end

# Open a student_directory.yml YAML file and write it out on one line
File.open('student_directory.yml', 'a') { |f| f.write(@directory) } 