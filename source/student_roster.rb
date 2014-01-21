require 'sqlite3'

class Student
  @@db = SQLite3::Database.open "students.db"

  def self.all
    query_result = @@db.execute("SELECT * FROM students")
    self.format_output(query_result)
  end

  def self.where(column, desired_value)
    query_result = @@db.execute("SELECT * FROM students WHERE #{column} = '#{desired_value}'")
    self.format_output(query_result)
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

Student.all
puts "---"
Student.where('first_name', 'Brick')