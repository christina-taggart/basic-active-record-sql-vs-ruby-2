class Student

  def initialize(data = {})
    @id = data[:id]
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @gender = data[:gender]
    @birthday = data[:birthday]
    @email = data[:email]
    @phone = data[:phone]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end
end

bob = Student.new()