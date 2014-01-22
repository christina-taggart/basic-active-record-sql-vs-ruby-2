require 'sqlite3'

class Student
  def initialize
    @db = SQLite3::Database.open "students.db"
  end
  def add_student(id, first_name, last_name, gender, birthday, email, phone, created_at, updated_at)
    @db.execute ("INSERT INTO students (first_name, last_name, gender,birthday,email, phone, created_at, updated_at)
      VALUES('#{first_name}','#{last_name}','#{gender}','#{birthday}','#{email}', '#{phone}', DATETIME('2013-01-01'), DATETIME('2014-01-01') )")
  end

  def delete_student(name)
    @db.execute("DELETE FROM students WHERE first_name = '#{name}'")
  end

  def list
    @db.execute("SELECT * FROM students")
  end

  def show_by_name(name)
    @db.execute ("SELECT * FROM students WHERE first_name = '#{name}'")

  end

  def show_by_attribute(attribute, criteria)
    @db.execute ("SELECT * FROM students WHERE #{attribute} = '#{criteria}'")
  end

  def birthday_month
    @db.execute("SELECT * FROM students WHERE MONTH(birthday) = #{month}")
  end

  def by_birthday
    @db.execute("SELECT * FROM students ORDER BY birthday")
  end

end

test = Student.new
puts test.list
test.add_student(5, 'bob', 'sealion', 'male', '2013-01-01', 'bob@sealion.com', '123.456.7890', DateTime.now, DateTime.now)
  p "----------------------"
puts test.show_by_name('Brick')
# test.delete_student('bob')
# p "========================="
# puts test.by_birthday

puts DateTime.now
# test.birthday_month(01)
# puts "----------"
# puts test.show_by_attribute('gender', 'male')


