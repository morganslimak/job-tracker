require 'rails_helper'

describe "User deletes existing category" do
  scenario "a user can delete a category" do
    category = Category.create(name: "Finance")
    visit categories_path

    expect(Category).to exist

    click_link "Destroy"

    expect(Category).not_to exist
  end
end
