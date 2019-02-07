require 'rails_helper'

RSpec.describe"features", type: :feature do
  describe "user goes to main page" do
    it "shows a registration link" do
      visit users_path

      expect(page).to have_content("Welcome")

      click_link "Register"
      expect(current_path).to eq(new_user_path)
    end
  end

  it "allows visitor to register new user" do
    # user = User.new(name: "John Doe", email: "johndoe@turing.com", password: "MickeyMouse12")
    name = "John Doe"
    email = "johndoe@turing.com"
    password = "MickeyMouse12"

    visit new_user_path
    # save_and_open_page

    fill_in "user[name]", with: name
    fill_in :user_email, with: email
    fill_in :user_password, with: password
    click_on "Create User"

    visit user_path

    expect(page).to have_content(name)
    expect(page).to have_content(email)
  end
end
