require_relative 'setup.rb'

class Student
  attr_reader :first_name, :last_name, :gender, :birthday, :email, :phone
  def initialize(args)
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @gender = args[:gender]
    @birthday = args[:birthday]
    @email = args[:email]
    @phone = args[:phone]
  end

  def save
    $db.execute(
        "INSERT INTO students
            (first_name, last_name, gender, birthday, email, phone, created_at, updated_at)
        VALUES
            (?, ?, ?, ?, ?, ?, DATETIME('now'), DATETIME('now'))",
        [@first_name, @last_name, @gender, @birthday, @email, @phone]
    )
  end

  def self.delete(where_val)
    $db.execute(
        "DELETE FROM students
        WHERE #{where_val}"
      )
  end

  def self.all
    $db.execute("SELECT * FROM students").each{|student| p student}
  end

  def self.where(where_val)
    $db.execute("SELECT * FROM students WHERE #{where_val}").each{|student| p student}
  end

end

# StudentDB.setup
#StudentDB.seed

vals = {first_name: "David", last_name: "Goodman", gender: "male",
birthday: "1990-09-04", email: "david@david.com", phone: "555-555-5555"}
new_student = Student.new(vals)
new_student.save
Student.delete("last_name='Goodman'")
Student.where("last_name = 'Thornton' ORDER BY first_name")
