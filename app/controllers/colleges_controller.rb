class CollegesController < ApplicationController

  def index
    @college_list = College.all
  end

  def new
    @college = College.new
  end

  def show
    @college = College.find(params[:id])
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
    @college = College.find(params[:id])
  end

  def update
    @college = College.find(params[:id])
    if @college.update(college_param)
      redirect_to colleges_path
    else
      render 'edit'
    end
  end

  def destroy
    @college = College.find(params[:id])
    @college.destroy
    redirect_to colleges_path
  end

  private
  def college_param
    params.require(:college).permit(:name, :established_year)
  end
end
