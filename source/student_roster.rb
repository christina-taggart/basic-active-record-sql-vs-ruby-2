require 'sqlite3'



class Student
@@db = SQLite3::Database.open('students.db')
@@db.results_as_hash = true

  attr_accessor :first_name, :last_name, :gender, :birthday, :email, :phone
  attr_reader :id


  def initialize(args = {})
    @args = args
    @id = args["id"]
    @first_name = args["first_name"]
    @last_name = args["last_name"]
    @gender = args["gender"]
    @birthday = args["birthday"]
    @email = args["email"]
    @phone = args["phone"]
  end

  def self.all
    return_value = []
    @@db.execute(
      <<-SQL
      SELECT * FROM students;
      SQL
      ).each{ |student_args| return_value << Student.new(student_args) }
    return_value
  end

  def self.where(placeholder, value)
    return_value = []
    @@db.execute("SELECT * FROM students WHERE #{placeholder}", "#{value}").each{ |student_args| return_value << Student.new(student_args) }
    return_value
  end

  def delete
    @@db.execute("DELETE FROM students WHERE id = #{id}")#.each{ |student_args| return_value << Student.new(student_args) }
  end

  def save
    time = "#{Time.now.year}-0#{Time.now.month}-#{Time.now.day}"
    puts time
    @@db.execute("INSERT INTO students ('first_name', 'last_name', 'gender', 'birthday', 'email', 'phone', 'created_at', 'updated_at') VALUES ('#{@first_name}', '#{@last_name}' , '#{@gender}', '#{@birthday}', '#{@email}', '#{@phone}', '#{time}', '#{time}')")
  end
end

brick = Student.new({ "first_name"=>"Brick", "last_name"=>"Thornton", "gender"=>"m", "birthday"=>"1980-02-03", "email"=>"brick@devbootcamp.com", "phone"=>"555-555-5555" })
puts brick.email
brick.save
# p Student.all
# puts "-------------------"
# brick =  Student.where("first_name = ?","Brick")[0]
# puts "-------------------"
# puts brick.id
# puts "-------------------"
# brick.delete
# puts "-------------------"
# p Student.all
# puts "-------------------"
# puts brick


 #Student.all.each{|student| p student.first_name}