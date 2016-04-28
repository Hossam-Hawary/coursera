class CoursesController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :true_user, only: [:edit, :update, :destroy]
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
  def true_user
    @user = Course.find(params[:id]).user
    redirect_to root_path unless current_user.id == @user.id
  end
end

