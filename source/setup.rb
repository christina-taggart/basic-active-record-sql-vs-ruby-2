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
          age INTEGER NOT NULL,
          cool_score INTEGER NOT NULL,
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )
  end

  def self.seed
    # Add a few records to your database when you start
    $db.execute_batch(
      <<-SQL
        INSERT INTO students
          (first_name, last_name, age, cool_score, created_at, updated_at)
        VALUES
          ('Brick','Thornton',42,7,DATETIME('now'), DATETIME('now'));
        INSERT INTO students
          (first_name, last_name, age, cool_score, created_at, updated_at)
        VALUES
          ('Adtiya','Mahesh',23,11,DATETIME('now'),DATETIME('now'));
        INSERT INTO students
          (first_name, last_name, age, cool_score, created_at, updated_at)
        VALUES
          ('Emmanuel','Kaunitz',26,10,DATETIME('now'),DATETIME('now'));
      SQL
    )
  end
end