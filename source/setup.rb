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
    $db.execute(
      <<-SQL
        INSERT INTO students
          (first_name, last_name, gender, birthday, email, phone, created_at, updated_at)
        VALUES
          ('Brick','Thornton', 'male', '2010-09-11', 'brick@devbootcamp.com', '555-555-4444', DATETIME('now'), DATETIME('now')),
          ('Spencer', 'Smitherman', 'male', '1990-04-10', 'spencersmitherman@gmail.com', '555-333-1111', DATETIME('now'), DATETIME('now')),
          ('Bobby', 'Chillens', 'male', '2001-05-11', 'bobby@bobby.com', '555-999-0000', DATETIME('now'), DATETIME('now'));
      SQL
    )
  end
end