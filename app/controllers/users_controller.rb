class UsersController < InheritedResources::Base
  #before_action :authenticate_user!
  private

    def user_params
      params.require(:user).permit(:name, :gender, :birthdate, :profile_img,:email,:password)
    end
end

