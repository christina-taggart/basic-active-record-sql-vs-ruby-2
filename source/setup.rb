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
          email VARCHAR(128) NOT NULL,
          phone VARCHAR(128) NOT NULL,
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
          (first_name, last_name, gender, birthday, email, phone, created_at, updated_at)
        VALUES
          ('Brick','Thornton', 'm', DATE('1980-02-03'), 'brick@devbootcamp.com','555-555-5555', DATETIME('now'), DATETIME('now'));


        INSERT INTO students
          (first_name, last_name, gender, birthday, email, phone, created_at, updated_at)
        VALUES
        ('Alex','Leishman', 'm', DATE('1990-02-20'), 'leishman3@gmail.com', '301.351.0949', DATETIME('now'), DATETIME('now'));


      INSERT INTO students
        (first_name, last_name, gender, birthday, email, phone, created_at, updated_at)
      VALUES
        ('Nicholas','Cu', 'm', DATE('1986-02-20'), 'nicholascu@gmail.com', '916.215.1110', DATETIME('now'), DATETIME('now'));
      -- Create two more students who are at least as cool as this one.
    SQL
  )
  end
end