require_relative "config"

class Student


  def add_student(first_name, last_name, gender, age, birthday, phone_number, created_at, updated_at)
    $db.execute(
    <<-SQL
      INSERT INTO students (first_name, last_name, gender, age, birthday, phone_number, created_at, updated_at)
      VALUES('#{first_name}','#{last_name}','#{gender}','#{age}','#{birthday}','#{phone_number}', 'DATETIME=('now')', 'DATETIME=('now')'))
      SQL
      )
  end

  def delete_student(id)
    $db.execute("DELETE FROM students WHERE id =?",id)
  end

  def self.all
    $db.execute("SELECT * FROM students")
  end

  def students_by_first_name(this_name)
    $db.execute("SELECT first_name FROM students WHERE first_name = ?", this_name)
  end

  def students_with_attribute(column, attribute)
     $db.execute("SELECT * FROM students WHERE '#{column}' '#{attribute}'")
   end

  def birthdays_this_month(month_num)
    $db.execute("SELECT * FROM students WHERE birthday LIKE '%-month_num-%'")
  end

  def students_by_birthday
    $db.execute("SELECT * FROM students GROUP BY birthday ORDER BY birthday DESC")
  end
end

p Student.all
bob = Student.new
p bob.students_by_first_name("Brick")
p bob.students_by_first_name("Emily")
p bob.students_with_attribute("gender","M")
bob.delete_student(1)
p Student.all
bob.students_by_birthday