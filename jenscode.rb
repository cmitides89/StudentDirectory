require 'rubygems'
require 'yaml'

class Person
attr_accessor :name
attr_accessor :email
attr_accessor :hometown
attr_accessor :github_user
attr_accessor :twitter
attr_accessor :fun_fact

def questions #if I named this initialize I don't need to call it further down with person.questions
print "What is your name? "
self.name = gets.strip.chomp
print "What is your email? "
self.email = gets.strip.chomp
while not self.email.include?("@")
print "You need to enter an email with a '@'! "
self.email = gets.strip.chomp
end
print "Where are you from? "
self.hometown = gets.strip.chomp
print "What's your GitHub username? "
self.github_user = gets.strip.chomp
print "Tell me a fun fact about yourself! "
self.fun_fact = gets.strip.chomp
end

end

class Student < Person
attr_accessor :reason_for_joining
end

class Instructor < Person
attr_accessor :type
end



@directory = ""
puts "Student Directory, v0.0.2 by Jen Lim"
print "Enter Student or Instructor, q to save and quit: "

while ((input = gets.strip.chomp) != 'q') do

person = nil
case input
when 'student'.downcase
person = Student.new
person.questions

print "What made you join WDI at GA? "
person.reason_for_joining = gets.strip.chomp
when 'instructor'.downcase

person = Instructor.new
person.questions

print "What sort of instructor are you? "
person.type = gets.strip.chomp

end
# Append this to our yaml file
@directory += person.to_yaml
puts @directory
print "Enter Student or Instructor, q to save and quit: "
end

# Open a student_directory.yml YAML file and write it out on one line
File.open('student_directory.yml', 'a') { |f| f.write(@directory) }