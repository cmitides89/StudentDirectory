<<<<<<< HEAD
require 'rubygems'
require 'yaml'
require 'pry'

class Person
  attr_accessor :name, :email, :github_user, :twitter, :fun_fact

  def initialize
    print "What is your name? "
    self.name = gets.strip.chomp
    print "What is your email? "
    self.email = gets.strip.chomp
    print "Whats your github name? "
    self.github_user = gets.strip.chomp
    print "what about your twitter name? "
    self.twitter = gets.strip.chomp
    print "tell me a fun fact... "
    self.fun_fact = gets.strip.chomp
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
end

class Student < Person
  attr_accessor :reason_for_joining

  def get_person_info
    super
    print "why are you taking this course? "
    self.reason_for_joining = gets.strip.chomp
  end
end

class Instructor < Person

  attr_accessor :type, :before_teaching
  def get_person_info
    super
    print "What type of instructor are you? "
    self.type = gets.strip.chomp
    print "What did you do before teaching? "
    self.before_teaching = gets.strip.chomp
  end
end

@directory = []
puts "Student Directory, v0.0.1 by Dan Garland and Constantin Mitides"
print "Enter Student or Instructor, q to save and quit, l to load existing students: "

=======
class Student < Person
  attr_accessor :reason_for_joining

  # Prompt the user for questions, including those extra quetions pertaining to 
  # Student objects
  #
  def ask_questions
    super
    print "What was your reason for joining? "
    self.reason_for_joining = gets.strip.chomp
  end

  # Provides a String that represents this Student, try me with puts!
  # 
  def to_s
    "ID: #{self.id}
    Type: #{self.class}
    Name: #{self.name}
    Email: #{self.email}
    Reason For Joining: #{self.reason_for_joining}"
  end
>>>>>>> 3fc05c687f05030dc13e8e8bf5f2d69f6045934c

  # TODO - Persists this Instructor object to the database
  #
  def save
    # Build a String of SQL, that will insert all the attributes into the persons table

<<<<<<< HEAD
 someone = Person.create_person(input)

  # Append this to yaml file
  # @directory << someone.to_yaml
  # puts @directory

  @directory << someone
  


  case input

  when 'l'
      #pull in existing people from the YAML file
      @directory += YAML.load_documents(File.open('student_directory.yml'))
  end
    print "Enter Student or Instructor, q to save and quit: "

  # Open a student_directory.yml YAML file and write it out on one line a appends vs overwrites
  File.open('student_directory.yml', 'a') do |f| 
    @directory.compact.each do |person|
      f.write(person.to_yaml)
    end
  end
end 
=======
    # Execute the SQL on the @@db object
  end

end
>>>>>>> 3fc05c687f05030dc13e8e8bf5f2d69f6045934c
