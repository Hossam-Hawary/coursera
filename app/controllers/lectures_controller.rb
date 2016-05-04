class LecturesController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :varifay_user, only: [:edit, :update, :destroy]
  load_and_authorize_resource
  def download_file
    lecture=Lecture.find(params[:lec_id])
    send_file lecture.lec_file.path
  end
  def create
    @lecture = Lecture.new(lecture_params)
    @lecture.user_id=current_user.id
    if @lecture.course.user!=current_user
      redirect_to root_path
    end
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
    lecture.liked_by current_user,:vote_scope => 'rank'
    lec_likes=lecture.get_likes(:vote_scope => 'rank').size
    lec_dislikes=lecture.get_dislikes(:vote_scope => 'rank').size
    vots={likes:lec_likes,dislikes:lec_dislikes}
    render :json => vots

  end
  def dislike_lecture
    lecture=Lecture.find(params[:lec_id])
    lecture.disliked_by current_user,:vote_scope => 'rank'
    lec_likes=lecture.get_likes(:vote_scope => 'rank').size
    lec_dislikes=lecture.get_dislikes(:vote_scope => 'rank').size
    vots={likes:lec_likes,dislikes:lec_dislikes}
    render :json => vots
  end
  def spam_lecture
    lecture=Lecture.find(params[:lec_id])
    lecture.downvote_from current_user, :vote_scope => 'spam'
    lec_spam=lecture.get_downvotes(:vote_scope => 'spam').size
    vots={removed?:false,spam:0}
    if lec_spam>5
      lecture.destroy
      vots[:removed?]=true
    end
    vots[:spam]=lec_spam
    render :json => vots

  end
  private

    def lecture_params
      params.require(:lecture).permit(:content, :lec_file, :course_id)
    end
  def varifay_user
    @user = Lecture.find(params[:id]).user
    redirect_to root_path unless current_user.id == @user.id
  end

  end

