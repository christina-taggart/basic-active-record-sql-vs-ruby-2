require 'sqlite3'


class Student
  @@db = SQLite3::Database.new 'students.db'

  def initialize(student)
    @first_name = student.fetch(:first_name)
    @last_name = student.fetch(:last_name)
    @gender = student.fetch(:gender)
    @birthdate = student.fetch(:birthdate)
    @phone = student.fetch(:phone)
    @created_at = Time.now
  end

  def self.all
    @@db.execute("SELECT * FROM students")
  end

  def self.where(column, value)
    @@db.execute(
      <<-SQL
        SELECT * FROM students WHERE "#{column}" ="#{value}"
      SQL
      )
  end

  def self.birthdays_for_month(month)
    birth_month = (month.to_s).rjust(2, '0')
     @@db.execute(
      <<-SQL
        SELECT * FROM students WHERE strftime('%m', birthdate) = '#{birth_month}'
      SQL
      )
  end

  def self.edit(column, value, student_id)
    @@db.execute(
      <<-SQL
        UPDATE students SET "#{column}" = "#{value}", updated_at = "#{Time.now}" WHERE id = "#{student_id}"
      SQL
      )
  end

  def save
    @@db.execute(
      <<-SQL
        INSERT INTO students
          (first_name, last_name, gender, birthdate, phone, created_at, updated_at)
        VALUES
          ("#{@first_name}", "#{@last_name}", "#{@gender}", "#{@birthdate}", "#{@phone}", "#{@created_at}", "#{Time.now}");
      SQL
    )
  end

  def self.delete(column, value)
    @@db.execute(
      <<-SQL
        DELETE FROM students WHERE "#{column}" = "#{value}"
      SQL
      )
  end

  def self.sorted_by(column)
    @@db.execute(
      <<-SQL
        SELECT * FROM students ORDER BY "#{column}"
      SQL
      )
  end
end

puts Student.sorted_by('last_name')