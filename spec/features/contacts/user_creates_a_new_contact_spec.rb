require 'rails_helper'

describe "User creates a new contact" do
  scenario "displays on company jobs page" do
    company = Company.create(name: "ESPN", city: "NYC")

    visit company_jobs_path(company)
    fill_in "contact[name]", with: "Amanda"
    fill_in "contact[position]", with: "Manager"
    fill_in "contact[email]", with: "test@test.com"
    click_button "Create"

    expect(page).to have_content("Amanda")
    expect(page).to have_content("Manager")
    expect(page).to have_content("test@test.com")
  end
end
