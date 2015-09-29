require "test_helper"

class JoinTheClubTest < Capybara::Rails::TestCase
  test "sign-uppable" do
    visit root_path
    click_link "Join the Club"

    fill_in "Handle", with: "DUDE"
    fill_in "Email", with: "guy@place.com"
    fill_in "Password", with: "12345678"
    fill_in "Confirm password", with: "12345678"

    click_button "Join the Club"

    assert_content "Totes personalized"
    
  end
end
