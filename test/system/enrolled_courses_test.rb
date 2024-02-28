require "application_system_test_case"

class EnrolledCoursesTest < ApplicationSystemTestCase
  setup do
    @enrolled_course = enrolled_courses(:one)
  end

  test "visiting the index" do
    visit enrolled_courses_url
    assert_selector "h1", text: "Enrolled courses"
  end

  test "should create enrolled course" do
    visit enrolled_courses_url
    click_on "New enrolled course"

    fill_in "Course", with: @enrolled_course.course_id
    fill_in "Semester", with: @enrolled_course.semester_id
    fill_in "Users", with: @enrolled_course.users_id
    click_on "Create Enrolled course"

    assert_text "Enrolled course was successfully created"
    click_on "Back"
  end

  test "should update Enrolled course" do
    visit enrolled_course_url(@enrolled_course)
    click_on "Edit this enrolled course", match: :first

    fill_in "Course", with: @enrolled_course.course_id
    fill_in "Semester", with: @enrolled_course.semester_id
    fill_in "Users", with: @enrolled_course.users_id
    click_on "Update Enrolled course"

    assert_text "Enrolled course was successfully updated"
    click_on "Back"
  end

  test "should destroy Enrolled course" do
    visit enrolled_course_url(@enrolled_course)
    click_on "Destroy this enrolled course", match: :first

    assert_text "Enrolled course was successfully destroyed"
  end
end
