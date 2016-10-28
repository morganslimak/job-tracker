require 'rails_helper'

describe "User creates a new comment" do
  scenario "displays on job page with newest comment first" do
    company = Company.create(name: "ESPN", city: "NYC")
    job = company.jobs.create(title: "Developer",
                              description: "Yayy!",
                              level_of_interest: 90)

    visit company_job_path(company, job)
    fill_in "comment[content]", with: "comment about job1"
    click_button "Create"
    fill_in "comment[content]", with: "comment about job2"
    click_button "Create"

    expect(page).to have_selector("ul li:nth-child(1)", text: "comment about job2")
    expect(page).to have_selector("ul li:nth-child(2)", text: "comment about job1")
  end
end
