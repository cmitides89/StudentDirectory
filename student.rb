require 'rubygems'
require 'yaml'

class Person
  attr_accessor :name, :email, :github_user, :twitter, :fun_fact, :favorite_bar, :favorite_color
end

class Student < Person
  attr_accessor :reason_for_joining, :bday, :pets
end

class Instructor < Person
  attr_accessor :type, :like_students
end

@directory = ""
puts "Student Directory, v0.0.1 by Dan Garland"
print "Enter Student or Instructor, q to save and quit: "

while ((input = gets.strip.chomp) != 'q') do
  person = nil
  case input

  when 'Student' 
    person = Student.new
    print "What is your name? "
    person.name = gets.strip.chomp
    print "What is your email? "
    person.email = gets.strip.chomp
    print "Why are you taking this course? "
    person.reason_for_joining = gets.strip.chomp
    print "whats your favorite bar? "
    person.favorite_bar = gets.strip.chomp
    print "whats your favorite color? "
    person.favorite_color = gets.strip.chomp
    print "when is your birthday? "
    person.bday = gets.strip.chomp
    print "do you have any pets? "

    
  when 'Instructor'
    print "What is your name? "
    person.name = gets.strip.chomp
    print "What is your email? "
    person.email = gets.strip.chomp
    print "Why are you taking this course? "
    person.reason_for_joining = gets.strip.chomp
    print "whats your favorite bar? "
    person.favorite_bar = gets.strip.chomp
    print "whats your favorite color? "
    person = Instructor.new
    print "do you like your students?"
    person.like_students = gets.strip.chomp

  end


  
  # Append this to our yaml file
  @directory += person.to_yaml
  puts @directory
  
  print "Enter Student or Instructor, q to save and quit: "
end

# Open a student_directory.yml YAML file and write it out on one line
File.open('student_directory.yml', 'a') { |f| f.write(@directory) } 
