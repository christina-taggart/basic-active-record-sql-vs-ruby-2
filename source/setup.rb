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
          age VARCHAR(64) NOT NULL,
          phone_number VARCHAR(64) NOT NULL,
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
          (first_name, last_name, gender, age, phone_number, created_at, updated_at)
        VALUES
          ('Brick','Thornton','M',40,1234567,DATETIME('now'), DATETIME('now'));

          SQL
          )

    $db.execute(
      <<-SQL
        INSERT INTO students
          (first_name, last_name, gender, age, phone_number, created_at, updated_at)
        VALUES
          ('Emily','Foley','F',28,1234566,DATETIME('now'),DATETIME('now'));
       SQL
      )

    $db.execute(
        <<-SQL
        INSERT INTO students
          (first_name, last_name, gender, age, phone_number, created_at, updated_at)
        VALUES
          ('Elizabeth','Fitzpatrick','F',28,1234555,DATETIME('now'),DATETIME('now'));
      SQL
    )
  end
end

