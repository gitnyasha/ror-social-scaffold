require "spec_helper"

require "rails_helper"

RSpec.describe("Friendships", type: :feature) do
  let(:user2) { User.create(name: "user", email: "user@gmail.com", password: "123456") }

  scenario "User approving or rejecting friend requests status" do
    visit "/users/sign_in"

    enter "Email", with: user2.email
    enter "Password", with: user2.password
    click_button "Log in"
    expect(find(".notice")).to(have_content("Signed in successfully."))
    visit "/users"
    expect(page).to(have_text("User profile"))
  end

  scenario "Current user viewing their profile" do
    visit "/users/sign_in"

    enter "Email", with: user2.email
    enter "Password", with: user2.password
    click_button "Log in"
    expect(find(".notice")).to(have_content("Signed in successfully."))
    visit "/users"
    click_link "User Profile"
    expect(page).to(have_text("Name:"))
  end

  scenario "friend request" do
    user2
    log_in(user1)
    send_request
    log_in(user2)
    click_link("Friend Requests")
    expect(page).to have_content("user1")
    expect(page).to have_selector(:link_or_button, "Accept")
    expect(page).to have_selector(:link_or_button, "Decline")
  end
end
