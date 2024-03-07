require "test_helper"

class EnrolledCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)  # Assuming you have a fixture named 'one' in users.yml
    @course = courses(:one)  # Assuming you have a fixture named 'one' in courses.yml
    @enrolled_course = enrolled_courses(:one)
  end

  test "should create enrolled_course" do
    assert_difference("EnrolledCourse.count") do
      post enrolled_courses_url, params: { enrolled_course: { course_id: @course.id, semester_id: @user.semester_id, users_id: @user.id } }
    end

    assert_redirected_to enrolled_course_url(EnrolledCourse.last)
  end
end
