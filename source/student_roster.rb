require 'sqlite3'
require_relative 'setup.rb'


class Student
  def initialize
     $db
  end

  def self.all
    people = $db.execute(
      <<-SQL
      SELECT * FROM students
      SQL
      )

    people.each do |person|
      puts "#{person[0]} #{person[2]}"
    end
  end



  def self.search_name(name)
    name_to_find = name
    $db.execute(
      <<-SQL
      SELECT * FROM students WHERE first_name = '#{name_to_find}'
      SQL
      )
  end

  def self.search_cool_score(score)
    score_to_find = score
       $db.execute(
      <<-SQL
      SELECT * FROM students WHERE cool_score < '#{score_to_find}'
      SQL
      )
  end

  def self.add_student(args)
    first = args[:first_name]
    last = args[:last_name]
    input_age = args[:age]
    input_cool_score = args[:cool_score]
    # input_created_at = Time.now
    # input_updated_at = Time.now
    $db.execute(
      <<-SQL
        INSERT INTO students
          (first_name, last_name, age, cool_score, created_at, updated_at)
        VALUES
          ('#{first}', '#{last}', '#{input_age}', '#{input_cool_score}', DATETIME('now'), DATETIME('now'));
        SQL
        )
  end

  def self.delete(id)
    id_to_delete = id
    $db.execute(
      <<-SQL
      DELETE FROM students WHERE id = '#{id_to_delete}'
      SQL
      )
  end



end



# Student.all
# Student.add_student(:first_name => 'Rick', :last_name => 'Rubio', :age => 25, :cool_score => 11)
# Student.search_name("Brick")
# Student.all
# puts "---"
# Student.delete(20)
# puts "----"
# Student.all
