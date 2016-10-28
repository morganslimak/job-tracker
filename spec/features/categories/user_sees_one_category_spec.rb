require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees a category" do
    category = Category.create(name: "Finance")
    company = Company.create(name: "Microsoft", city: "Some city")
    company.jobs.create(title: "Manager", level_of_interest: 90, category_id: category.id)

    visit category_path(category)

    expect(page).to have_content("Finance")
    expect(page).to have_content("Manager")
  end
end
