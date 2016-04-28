class LecturesController < InheritedResources::Base

  private

    def lecture_params
      params.require(:lecture).permit(:content, :lec_file, :course_id, :user_id)
    end
end

