class StudentsController < ApplicationController

  def index
    @student_list = Student.all.includes(:college).order(student_id: :asc)
  end

  def new
    @student = Student.new
  end

  def show
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      flash[:alert] = {'form_errors' => @student.errors.full_messages}
      redirect_to action: 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      flash[:notice] = 'Student\'s data Updated'
      redirect_to students_path
    else
      flash[:alert] = {'form_errors' => @student.errors.full_messages}
      redirect_to action: 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    flash[:notice] = "Student Deleted!"
    redirect_to students_path
  end

  private
  def student_params
    params.require(:student).permit(:student_id, :department, :maths, :physics, :chemistry, :year, :college_id)
  end
end
