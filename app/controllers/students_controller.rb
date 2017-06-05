class StudentsController < ApplicationController

  def index
    @student_list = Student.all
  end

end
