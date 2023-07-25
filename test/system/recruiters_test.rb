require "application_system_test_case"

class RecruitersTest < ApplicationSystemTestCase
  setup do
    @recruiter = recruiters(:one)
  end

  test "visiting the index" do
    visit recruiters_url
    assert_selector "h1", text: "Recruiters"
  end

  test "should create recruiter" do
    visit recruiters_url
    click_on "New recruiter"

    fill_in "Email", with: @recruiter.email
    fill_in "Name", with: @recruiter.name
    click_on "Create Recruiter"

    assert_text "Recruiter was successfully created"
    click_on "Back"
  end

  test "should update Recruiter" do
    visit recruiter_url(@recruiter)
    click_on "Edit this recruiter", match: :first

    fill_in "Email", with: @recruiter.email
    fill_in "Name", with: @recruiter.name
    click_on "Update Recruiter"

    assert_text "Recruiter was successfully updated"
    click_on "Back"
  end

  test "should destroy Recruiter" do
    visit recruiter_url(@recruiter)
    click_on "Destroy this recruiter", match: :first

    assert_text "Recruiter was successfully destroyed"
  end
end
