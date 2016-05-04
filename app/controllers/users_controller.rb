class UsersController < InheritedResources::Base
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :varify_user, only: [:edit, :update, :destroy]


  private

    def user_params
      params.require(:user).permit(:name, :gender, :birthdate, :profile_img,:email,:role,:password,:password_confirmation)
    end
  def varify_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user.id == @user.id
  end

end

