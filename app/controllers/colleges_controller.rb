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
      flash[:alert] = {'form_errors' => @college.errors.full_messages}
      redirect_to action: 'new'
    end
  end

  def edit
    @college = College.find(params[:id])
  end

  def update
    @college = College.find(params[:id])
    if @college.update(college_param)
      flash[:notice] = 'College\'s data updated!'
      redirect_to colleges_path
    else
      flash[:alert] = {'form_errors' => @college.errors.full_messages}
      redirect_to action: 'edit'
    end
  end

  def destroy
    @college = College.find(params[:id])
    @college.destroy
    redirect_to colleges_path
  end

  def enrollment
    @college_list = College.all.includes(:students) # Eager loading
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
