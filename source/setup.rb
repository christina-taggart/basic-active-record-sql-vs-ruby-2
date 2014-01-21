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