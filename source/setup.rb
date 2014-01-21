require 'sqlite3'

$db = SQLite3::Database.new 'students.db'

module StudentDB
  def self.setup
    $db.execute(
      <<-SQL
        CREATE TABLE students (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,
          gender VARCHAR(64) NOT NULL,
          birthdate DATE NOT NULL,
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
          (first_name, last_name, gender, birthdate, phone, created_at, updated_at)
        VALUES
          ('Brick','Thornton','M','1971-02-27','555-555-1234',DATETIME('now'), DATETIME('now')),
          ('Roy','Lee','M','1989-11-10','555-555-1235',DATETIME('now'), DATETIME('now')),
          ('Patrick','Vilhena','M','1984-03-22','555-555-1236',DATETIME('now'), DATETIME('now'));
      SQL
    )
  end
end