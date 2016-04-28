class LecturesController < InheritedResources::Base
  before_action :authenticate_user!
  def create
    @lecture = Lecture.new(lecture_params)
    @lecture.user_id=current_user.id
    respond_to do |format|
      if @lecture.save
        format.html { redirect_to @lecture, notice: 'Lecture was successfully created.' }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end
  private

    def lecture_params
      params.require(:lecture).permit(:content, :lec_file, :course_id)
    end

  end

