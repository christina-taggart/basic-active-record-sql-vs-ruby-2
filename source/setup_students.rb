require 'sqlite3'

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
          ('Brick','Thornton', 'male', DATE('1971-02-23' ), 'brick@devbootcamp.com', '415-123-4567', DATETIME('now'), DATETIME('now')),
          ('Matt', 'Higgins', 'male', DATE('1988-12-08'), 'matthew.alan.higgins@gmail.com', '661-993-3324', DATETIME('now'), DATETIME('now')),
          ('John', 'Olmsted', 'male', DATE('1987-02-12'), 'johnaolmsted@gmail.com', '510-542-1601', DATETIME('now'), DATETIME('now'));
      SQL
    )
  end
end

StudentDB.setup
StudentDB.seed