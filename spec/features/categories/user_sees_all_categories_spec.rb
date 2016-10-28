require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    company = Category.create(name: "Finance")
    company_two = Category.create(name: "Web Development")

    visit categories_path

    expect(page).to have_content("Finance")
    expect(page).to have_content("Web Development")
  end

end
