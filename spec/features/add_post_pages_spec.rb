require 'rails_helper'
  describe "the add a post process" do
  it "adds a new post" do
    visit root_path
    user = FactoryGirl.create(:user)
    click_on "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    click_on "Add Post"
    fill_in "Post", with: "This is a post"
    click_button "Create Post"
    expect(page).to have_content "Post successfully added"
  end
end
