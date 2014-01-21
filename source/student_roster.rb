require 'sqlite3'

class Student
  @@db = SQLite3::Database.open "students.db"

  def self.all
    query_result = @@db.execute("SELECT * FROM students")
    self.format_output(query_result)
  end

  def self.where(column_and_operator, desired_value)
    query_result = @@db.execute("SELECT * FROM students WHERE #{column_and_operator}'#{desired_value}'")
    self.format_output(query_result)
  end

  def self.new(new_first_name, new_last_name, new_gender, new_birthday, new_email, new_phone)
    @@db.execute(
      <<-SQL
      INSERT INTO students
          (first_name, last_name, gender, birthday, email, phone, created_at, updated_at)
        VALUES
          ('#{new_first_name}', '#{new_last_name}', '#{new_gender}', DATE('#{new_birthday}'),
           '#{new_email}', '#{new_phone}', DATETIME('now'), DATETIME('now'));
      SQL
      )
  end

  def self.delete(column_and_operator, desired_value)
    @@db.execute("DELETE FROM students WHERE #{column_and_operator}'#{desired_value}'")
  end

  private

  def self.format_output(query_result)
    query_result.each do |row|
      row_string = String.new
      row.each { |datum| row_string += "#{datum}  " }
      puts row_string
    end
  end

end



#-----DRIVERS-----

# Student.all
# puts "---testing WHERE---"
# Student.where('first_name', 'Brick')
# puts "---"
# Student.delete("id", 4)
# Student.all
puts "---WHERE birthday > '1990-01-01'---"
Student.where("birthday>", "1990-01-01")
puts "---WHERE last_name LIKE 'H%'---"
Student.where("last_name LIKE", "H%")
puts "---adding new student---"
Student.new("Darcey", "Lachtman", "female", "1991-01-16", "darcey@lachtman.com", "515-151-3839")
Student.all