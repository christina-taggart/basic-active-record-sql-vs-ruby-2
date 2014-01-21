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
          birthday DATETIME NOT NULL,

          -- add the additional attributes here!

          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )
  end


  def self.drop_student_table
    $db.execute(
      <<-SQL
        DROP TABLE students ;
      SQL
    )
  end

  def self.seed
    # Add a few records to your database when you start
    $db.execute(
      <<-SQL
        INSERT INTO students
          (first_name, last_name, created_at, updated_at, birthday)
        VALUES
          ('Brick','Thornton',DATETIME('now'), DATETIME('now'), '1970-02-02');

        -- Create two more students who are at least as cool as this one.
      SQL
    )
  end
end

