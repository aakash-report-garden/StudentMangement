class StudentsController < ApplicationController

  def index
    @student_list = Student.all.order(student_id: :asc)
  end

  def new
    @student = Student.new
  end

  def show
    @student = Student.find_by_id(params[:id]) or not_found
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find_by_id(params[:id]) or not_found
  end

  def update
    @student = Student.find_by_id(params[:id]) or not_found
    if @student.update(student_params)
      redirect_to students_path
    else
      render 'edit'
    end
  end

  def destroy
    @student = Student.find_by_id(params[:id]) or not_found
    @student.destroy
    redirect_to students_path
  end

  private
  def student_params
    params.require(:student).permit(:student_id, :department, :maths, :physics, :chemistry, :year, :college_id)
  end
end
