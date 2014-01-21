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
          birthday DATETIME NOT NULL,
          email VARCHAR(255) NOT NULL,
          phone VARCHAR(64) NOT NULL,
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )
  end

  def self.seed
    $db.execute_batch(
      <<-SQL
        INSERT INTO students
          (first_name, last_name, gender, birthday, email, phone, created_at, updated_at)
        VALUES
          ('Brick','Thornton', 'M', '1970-04-28', 'brick@dbc.com', '189-233-2927', DATETIME('now'), DATETIME('now'));
        INSERT INTO students
          (first_name, last_name, gender, birthday, email, phone, created_at, updated_at)
        VALUES
          ('Andy', 'Lee', 'M', '1920-02-12', 'andy@dbc.com', '123-456-7890', DATETIME('now'), DATETIME('now'));
        INSERT INTO students
          (first_name, last_name, gender, birthday, email, phone, created_at, updated_at)
        VALUES
          ('Christina', 'Taggart', 'F', '1971-03-26', 'christina@dbc.com', '222-222-2222', DATETIME('now'), DATETIME('now'));
      SQL
    )
  end
end



StudentDB.setup
StudentDB.seed