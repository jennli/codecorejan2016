# Build a simple student database program in the command line that does the following:
# 1. When you first start the program it will give you the option to enter commands:
#     l: display all students in the database with id beside them
#     n: enter new student data
#     s: it will prompt you to display more details about a student by entering its id from the listing in the previous command.
#    d: it will prompt you to delete a student by its id

# 2. When you want to enter a new student (n command) it will prompt you for the following: name, email, courses (separated by commas). After that it will prompt you to enter the grade on every course entered for that student.
# 3. At any point you can type `exit` to stop the program.
# 4. After finishing any command it will go back to step 1, listing all possible commands.

require "./student.rb"

class StudentDatabaseProgram

  attr_reader :student_database, :id_counter

  def initialize
    @student_database = []
    @id_counter = 0
  end

  def this.start_program
    user_selection = ""

    loop do
      puts "please enter 'l', 'n', 's', 'd', or 'Exit':"
      puts "l: display all students"
      puts "n: enter new student data"
      puts "s: display student detail"
      puts "d: delete a student"
      # user_selection = gets.chomp
      break if user_selection.upcase == "EXIT"

      case user_selection
      when "l"
        display_all
      when "n"
        add_student
      when "s"
        display_detail
      when "d"
        delete_student
      end
    end

  end

  private

  def add_student

    puts "What is the name of the student? "
    name = gets.chomp.upcase

    puts "What is the email of the student? "
    email = get.chomp

    id_counter += 1
    student = Student.new(id_counter, name, email)
    studentDB.push(student)
    puts "you have successfully added #{name} to the database!"
    puts "#{name}'s id number is #{id_counter}"

    puts "List all the courses this student took, separated by ',': "
    course_input = gets.chomp
    course_input.split(",").each do |x|
      puts "what grade did the student get on #{x.upcase}?"
      student.course_hash[x.upcase.to_sym] = gets.chomp.to_i
    end



  end





  def delete_student
    id = -1
    sure = false

    loop do
      puts "please enter student id to be deleted: "
      id = gets.chomp.to_i

      puts "Are you sure you want to delete student with id #{id}?"
      puts "Enter 'yes' or 'no' "
      break if id > -1 && sure
      @student_database.delete(id)
    end

    def display_all
      @student_database.keys.map {|x| "#{x}: #{@student_database[x][name]} " }
    end

    def display_detail


    end

  end
