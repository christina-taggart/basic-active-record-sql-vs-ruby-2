require_relative 'setup.rb'

class Student
  def initialize(args)
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @gender = args[:gender]
    @birthday = args[:birthday]
    @email = args[:email]
    @phone = args[:phone]
  end

  def save
    $db.execute("INSERT INTO students (first_name, last_name, ")
  end

  def self.delete(where_val)

  end

  def self.all
  end

  def self.where(where_val)
  end

end

# StudentDB.setup
StudentDB.seed

# vals = {first_name: "David", last_name: "Goodman", gender: "male",
# birthday: "1990-09-04", email: "david@david.com", phone: "555-555-5555"}
# new_student = Student.new(vals)
puts $db.execute("select * from students")

