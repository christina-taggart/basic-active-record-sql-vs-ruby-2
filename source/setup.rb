=begin
+------------+
| students   |
+------------+
| id         |
| first_name |
| last_name  |
| gender     |
| birthday   |
| email      |
| phone      |
+------------+
=end
require 'sqlite3'

# If you want to overwrite your database you will need
# to delete it before running this file
$db = SQLite3::Database.new "students.db"

module StudentDB
  def self.setup
    $db.execute(
      <<-SQL
        CREATE TABLE students (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,
          gender VARCHAR(64) NOT NULL,
          birthday DATE NOT NULL,
          email VARCHAR(64) NOT NULL,
          phone VARCHAR(64) NOT NULL,
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )
  end

  def self.seed
    # Add a few records to your database when you start

    $db.execute(
      <<-SQL
        INSERT INTO students
          (first_name, last_name, gender, birthday, email, phone, created_at, updated_at)
        VALUES
          ('Brick','Thornton', 'Male', '1970-10-31', 'brick@devbootcamp.com', '111-555-6666', DATETIME('now'), DATETIME('now'));
      SQL
      )
    $db.execute(
      <<-SQL
      INSERT INTO students
        (first_name, last_name, gender, birthday, email, phone, created_at, updated_at)
      VALUES
        ('Moly','Thornton', 'Female', '1979-10-31', 'moly@devbootcamp.com', '111-555-6666', DATETIME('now'), DATETIME('now'));
      SQL
    )
    $db.execute(
      <<-SQL
        INSERT INTO students
          (first_name, last_name, gender, birthday, email, phone, created_at, updated_at)
        VALUES
          ('Bob','Thomas', 'Male', '1975-10-31', 'bobbers@devbootcamp.com', '222-555-6666', DATETIME('now'), DATETIME('now'));
      SQL
    )
  end
end

class Student

  def initialize(args)
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @gender = args[:gender]
    @birthday = args[:birthday]
    @email = args[:email]
    @phone = args[:phone]
  end

  def all
    $db.execute ("SELECT * FROM students")
  end

  def where(field, data, operator="=")
    $db.execute("SELECT * FROM students WHERE #{field} #{operator} '#{data}'")
  end

  def add
    $db.execute(
      <<-SQL
        INSERT INTO students
          (first_name, last_name, gender, birthday, email, phone, created_at, updated_at)
        VALUES
          ("#{@first_name}","#{@last_name}", "#{@gender}", "#{@birthday}", "#{@email}", "#{@phone}", DATETIME('now'), DATETIME('now'));
      SQL
    )
  end

  def delete(field, data, operator="=")
    $db.execute("DELETE FROM students WHERE #{field} #{operator} '#{data}'")
  end
end

#------------DRIVE CODE--------------#

test_student = Student.new({first_name: 'BRUCE', last_name: 'LEE', gender: 'Female', birthday: '2011-12-31', email: 'spencer.smitherman@gmail.com', phone: '555-333-8888'})
#test_student.add # Uncomment to add this student into the database
 p test_student.all
test_student.where('first_name', 'Brick') #=> Should see the record for student Brick Thornton
p test_student
test_student.where('birthday', '2011%', 'LIKE')
test_student.delete('id', 8)