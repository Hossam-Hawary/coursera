class CoursesController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :varifay_user, only: [:edit, :update, :destroy]
  load_and_authorize_resource
  before_action :set_course_id,only: [:show]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_course
  def create
    @course = Course.new(course_params)
    @course.user_id=current_user.id
    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Lecture was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end
  private

    def course_params
      params.require(:course).permit(:title)
    end
  def varifay_user
    @user = Course.find(params[:id]).user
    redirect_to root_path unless current_user.id == @user.id
  end
  def set_course_id
    session[:course_id]=params[:id]
  end
  def invalid_course
    logger.error "Attempt to access invalid Course #{params[:id]}"
    redirect_to courses_path, notice: 'Invalid course'
  end
end

