class UsersController < InheritedResources::Base

  private

    def user_params
      params.require(:user).permit(:name, :gender, :birthdate, :profile_img)
    end
end

