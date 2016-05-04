class UsersController < InheritedResources::Base
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :varify_user, only: [:edit, :update, :destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_profile

  # def create
  #   @user = User.new(user_params)
  #   respond_to do |format|
  #     if @user.save
  #       format.html { redirect_to @user, notice: 'user was successfully created.' }
  #       format.json { render :show, status: :created, location: @user }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  private

    def user_params
      params.require(:user).permit(:name, :gender, :birthdate, :profile_img,:email,:role,:password,:password_confirmation)
    end
  def varify_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user.id == @user.id
  end
  def invalid_profile
    logger.error "Attempt to access invalid profile #{params[:id]}"
    redirect_to users_path, notice: 'Invalid prfile'
  end
end

