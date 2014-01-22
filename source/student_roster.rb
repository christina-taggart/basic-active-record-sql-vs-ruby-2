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

  def add
    $db.execute(
        "INSERT INTO students
          (first_name, last_name, gender, birthday, email, phone, created_at, updated_at)
        VALUES
          (?, ?, ?, ?, ?, ?, DATETIME('now'), DATETIME('now'))",
          [@first_name, @last_name, @gender, @birthday, @email, @phone])
  end

  def self.delete(id)
    $db.execute("DELETE FROM students WHERE id = #{id}")
  end

  def self.all
    $db.execute("SELECT * FROM students").each { |row| puts row }
  end

  def self.where(id)
    $db.execute("SELECT * FROM students WHERE id = #{id}")
  end

end

new_guy = Student.new({first_name: 'Johnny', last_name: 'Boots', gender: 'male', birthday: '2000-10-11', email: 'john@boots.com', phone: '978-444-2222'})
new_guy.add
Student.all
Student.delete(4)
p Student.where(2)