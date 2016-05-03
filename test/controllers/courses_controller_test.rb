require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    @course = courses(:valid_course)
    @user = users(:valid_user)
  end

  test "should get index" do
    sign_in @user          # sign_in(resource)
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
    assert_select '#header1-40', 1
  end
  # test "should redirect to login_page" do
  #   sign_in @user          # sign_in(resource)
  #   get :edit, id: @course
  #   assert_redirected_to root_path(assigns(:user))
  # end
  #
  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end
  #
  # test "should create course" do
  #   assert_difference('Course.count') do
  #     post :create, course: { title: @course.title, user_id: @course.user_id }
  #   end
  #
  #   assert_redirected_to course_path(assigns(:course))
  # end
  #
  # test "should show course" do
  #   get :show, id: @course
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get :edit, id: @course
  #   assert_response :success
  # end
  #
  # test "should update course" do
  #   patch :update, id: @course, course: { title: @course.title, user_id: @course.user_id }
  #   assert_redirected_to course_path(assigns(:course))
  # end
  #
  # test "should destroy course" do
  #   assert_difference('Course.count', -1) do
  #     delete :destroy, id: @course
  #   end
  #
  #   assert_redirected_to courses_path
  # end
end
