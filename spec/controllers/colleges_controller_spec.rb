require 'rails_helper'

describe CollegesController, type: :controller do
  before(:each) do
    @college_1 = College.create({name: 'Oxford', established_year: 1880 })
    @college_2 = College.create({name: 'Cambridge', established_year: 1980 })
    @college_3 = College.create({name: 'Havard', established_year: 1779 })
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
    expect(assigns(:college_list)).to eq(Array(College.all))
  end

  it 'test creation of new college' do
    expect(College.all.count).to eql 3
    post :create, params: {:college =>{:name=> 'IIT', :established_year=> 1890}}
    expect(College.all.count).to eql 4

  end

  it 'test update of an existing college' do
    college = College.find_by_name('Oxford')
    expect(college.established_year).to eql 1880
    # TODO Correct way of passing params ?
    put :update, :id => college.id, :college => {:name=> 'Oxford', :established_year=> 1990}
    college.reload
    expect(college.established_year).to eql 1990
  end

  it 'test retrieval of an existing college object' do
    college = College.find_by_name('Oxford')
    get :show, :id => college.id
    expect(response).to be_success
    expect(response).to render_template(:show)
    expect(assigns(:college)).to eq(college)
  end

  it 'test deletion of an existing college object' do
    college = College.find_by_name('Oxford')
    delete :destroy, :id => college.id
    expect(College.find_by_name('Oxford')).to eq(nil)
  end

  it 'test partial search of college' do
    post :search, params: {'search_query' => 'rd'}
    expect(assigns(:colleges)).to eq([@college_1, @college_3])
  end

end

