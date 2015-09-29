require "test_helper"

class LoggedOutSeesGenericHomepageTest < Capybara::Rails::TestCase
  test "Sees generic page when not logged in" do
    guy = User.create email: "guy@place.com", password: "12345678", handle: "DUDE", first_name: "Guy", last_name: "McGee"

    visit root_path
    assert_content page, "Sign In"
    refute_content page, "Totes personalized"

  end

  test "Sees personalized page when logged in" do
    guy = User.create email: "guy@place.com", password: "12345678", handle: "DUDE", first_name: "Guy", last_name: "McGee"

    visit root_path

    fill_in "Login", with: "guy@place.com"
    fill_in "Password", with: "12345678"

    click_button "Sign In"

    assert_content page, "Totes personalized"
    # assert_content page, "Sign In"
    # refute_content page, "Generic shit"
  end
end
