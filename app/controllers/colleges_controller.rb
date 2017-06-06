class CollegesController < ApplicationController

  def index
    @college_list = College.all
  end

  def new
    @college = College.new
  end

  def show
    @college = College.find_by_id(params[:id]) or not_found
  end

  def create
    @college = College.new(college_param)
    if @college.save
      redirect_to colleges_path
    else
      render 'new'
    end
  end

  def edit
    @college = College.find_by_id(params[:id]) or not_found
  end

  def update
    @college = College.find_by_id(params[:id]) or not_found
    if @college.update(college_param)
      redirect_to colleges_path
    else
      render 'edit'
    end
  end

  def destroy
    @college = College.find_by_id(params[:id]) or not_found
    @college.destroy
    redirect_to colleges_path
  end

  def enrollment
    @college_list = College.all
  end

  def search
    @colleges = College.none
    if request.post?
      @colleges = College.where("lower(name) LIKE ?", "%#{params[:search_query].downcase}%")
    end
  end

  private
  def college_param
    params.require(:college).permit(:name, :established_year)
  end
end
