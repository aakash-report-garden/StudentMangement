require 'rails_helper'

describe StudentsController, type: :controller do
  before(:each) do
    @college_1 = College.create({name: 'Oxford', established_year: 1880 })
    @college_2 = College.create({name: 'Cambridge', established_year: 1980 })
    Student.create({student_id: 1, department: 'CS', maths: 43, physics: 99, chemistry: 65, year: 2016, college_id: @college_1.id })
    Student.create({student_id: 2, department: 'EC', maths: 21, physics: 52, chemistry: 54, year: 2015, college_id: @college_2.id })
    Student.create({student_id: 3, department: 'CS', maths: 56, physics: 77, chemistry: 65, year: 2017, college_id: @college_2.id })
    Student.create({student_id: 4, department: 'EC', maths: 21, physics: 52, chemistry: 99, year: 2000, college_id: @college_2.id })
    Student.create({student_id: 5, department: 'EC', maths: 13, physics: 66, chemistry: 64, year: 2015, college_id: @college_1.id })
  end

  it 'test rendering of home page' do
    get :index
    expect(response).to be_success
    expect(response).to render_template(:index)
    expect(assigns(:student_list)).to eq(Array(Student.all))
  end

  it 'test creation of new student' do
    expect(Student.all.count).to eql 5
    post :create, params: {:student =>{:student_id=> 6, :department=> 'ME', :maths=> 90, :physics=> 90, :chemistry=> 90, :year=> 2014, :college_id=> @college_1.id}}
    expect(Student.all.count).to eql 6

  end

  it 'test update of an existing student' do
    student = Student.find_by_student_id(2)
    expect(student.maths).to eql 21
    # TODO Correct way of passing params ?
    put :update, :id => student.id, :student => {:student_id=> 2, :department=> 'EC', :maths=> 90, :physics=> 52, :chemistry=> 54, :year=> 2015, :college_id=> @college_2.id}
    student.reload
    expect(student.maths).to eql 90
  end

  it 'test retrieval of an existing student object' do
    student = Student.find_by_student_id(3)
    get :show, :id => student.id
    expect(response).to be_success
    expect(response).to render_template(:show)
    expect(assigns(:student)).to eq(student)
  end

  it 'test deletion of an existing student object' do
    student = Student.find_by_student_id(3)
    delete :destroy, :id => student.id
    expect(Student.find_by_student_id(3)).to eq(nil)
  end
end

