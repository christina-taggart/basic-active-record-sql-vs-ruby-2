require 'sqlite3'

class Student
  attr_reader :first_name, :last_name, :gender, :birthday, :email, :phone, :created_at, :updated_at, :data
  def initialize(data = {})
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @gender = data[:gender]
    @birthday = data[:birthday]
    @email = data[:email]
    @phone = data[:phone]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

  def add(database)
    database.execute(
      <<-SQL
        INSERT INTO students
          (first_name, last_name, gender, birthday, email, phone, created_at, updated_at)
        VALUES
          ('#{first_name}','#{last_name}', '#{gender}', '#{birthday}', '#{email}', '#{phone}', '#{created_at}', '#{updated_at}');
        SQL
    )
  end


  def delete(database)
    database.execute("delete from students where first_name = '#{first_name}' and last_name = '#{last_name}'")
  end

  def self.all(database)
    database.execute("select first_name, last_name from students").each {|student| puts "#{student[0]} #{student[1]}"}
  end

  def self.first_name(database, first_name)
    database.execute("select first_name, last_name from students where first_name = '#{first_name}'").each {|student| puts "#{student[0]} #{student[1]}"}
  end

  def self.attribute(database, attribute, value)
    database.execute("select first_name, last_name from students where #{attribute} = '#{value}'").each {|student| puts "#{student[0]} #{student[1]}"}
  end

  def self.birthdays_this_month(database, month)
    database.execute("select first_name, last_name from students where strftime('%m', birthday) = #{month}").each {|student| puts "#{student[0]} #{student[1]}"}
  end

  def self.order_by_birthday(database)
    database.execute("select first_name, last_name from students order by birthday").each {|student| puts "#{student[0]} #{student[1]}"}
  end

end


bob = Student.new(first_name: 'Bob')
db = SQLite3::Database.new "students.db"

# bob.add(db)
bob.delete(db)
Student.all(db)
Student.first_name(db, 'Brick')
Student.attribute(db, :first_name, 'Brick')
Student.birthdays_this_month(db, 04)
Student.order_by_birthday(db)