
class Student

  attr_accessor :id, :name, :email, :courses_hash

  def initialize(id, name, email)
    @id, @name, @email, @course_hash = id, name, email, Hash.new(0)
  end

  def display_id_name
    " #{id}: #{name}"
  end

end
