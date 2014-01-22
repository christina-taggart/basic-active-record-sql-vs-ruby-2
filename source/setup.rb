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
          ('Brick','Thornton', 'male', DATE('2011-01-01'), 'brick@thornton.com', '555.555.5555', DATETIME('now'), DATETIME('now')),
          ('Nikolas', 'Friesen', 'female', DATE('1998-12-24'), 'agustina_braun@wintheiser.info',  '449.897.7415', DATETIME('now'), DATETIME('now')),
          ( 'Randi', 'Halvorson', 'male',  DATE('1997-01-29'),  'heber.upton@bechtelarwisozk.biz', '697.436.2633', DATETIME('now'), DATETIME('now'));
        -- Create two more students who are at least as cool as this one.
      SQL
    )
  end
end


StudentDB.setup

StudentDB.seed