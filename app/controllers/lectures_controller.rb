class LecturesController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :true_user, only: [:edit, :update, :destroy]
  def download_file
    lecture=Lecture.find(params[:lec_id])
    send_file lecture.lec_file.path
  end
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
  def like_lecture
    lecture=Lecture.find(params[:lec_id])
    lecture.liked_by current_user
    lec_likes=lecture.get_likes.size
    lec_dislikes=lecture.get_dislikes.size
    vots={likes:lec_likes,dislikes:lec_dislikes}
    render :json => vots

  end
  def dislike_lecture
    lecture=Lecture.find(params[:lec_id])
    lecture.disliked_by current_user
    lec_likes=lecture.get_likes.size
    lec_dislikes=lecture.get_dislikes.size
    vots={likes:lec_likes,dislikes:lec_dislikes}
    render :json => vots
  end
  private

    def lecture_params
      params.require(:lecture).permit(:content, :lec_file, :course_id)
    end
  def true_user
    @user = Lecture.find(params[:id]).user
    redirect_to root_path unless current_user.id == @user.id
  end

  end

